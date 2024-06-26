import { createServer, Server as NetServer, Socket } from 'net';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import fs from 'fs';
import Client, { socketType } from './concepts/client/client.js';
import Packet from './packet/packet.js';
import { statusCode } from './status.js';
import Logger from './util/logging.js';
import config from './config.js';
import Matchmaker from './util/matchmaker.js';

const { ip, port } = config.main;

export default class Server {
  /**
   * Current `NetServer` instance
   */
  private readonly instance: NetServer;

  constructor() {
    // Create a server instance by binding the wiretap function
    // to the server context to have access inside the method
    // to local fields and methods
    this.instance = createServer(this.connectionListener.bind(this));
  }

  public async run(): Promise<void> {
    return new Promise((resolve, reject) => {
      if (this.instance.listening) {
        reject(new Error('Attempt start an already running server'));
      }
  
      this.instance.listen(Number(port), () => {
        Logger.info(`Server started on ${ip}:${port}`);
        resolve();
      });
    });
  }

  private connectionListener(socket: Socket) {
    const client = Client.create(socket, socketType.tcp);
    Logger.info(`Client ${client.uuid} connected`);
    this.verifyClient(client);

    socket.on('data', async data => {
      await Packet.parse(client, data);
    });

    socket.on('close', async _ => {
      Logger.info(`Client ${client.uuid} disconnected`);
      this.onClientRemoved(client);
      await Client.remove(client);
    });

    socket.on('error', async error => {
      this.onClientRemoved(client);
      await Client.remove(client);

      if (error.message.includes('ECONNRESET')) {
        Logger.info('Socket violently disconnected');
        return;
      }

      Logger.error(`Socket error handled: ${error.stack}`);
    });
  }

  private onClientRemoved(client: Client) {
    Matchmaker.removeWaiting(client);
  }

  /**
   * Load all files from `src/initializers`
   */
  public async loadInitializers(): Promise<void> {
    // Get current directory, for us src
    const directory = dirname(fileURLToPath(import.meta.url));
    const initFiles = fs.readdirSync(`${directory}/initializers`, 'utf8');

    for (const file of initFiles) {
      if (!file.endsWith('.js'))
        continue;
      
      Logger.info(`Initialize: ${file}...`);
      await import(`file://${directory}/initializers/${file}`);
    }

    Logger.info('Initialize done');
  }

  private verifyClient(client: Client) {
    if (!config.client.verification.enabled) {
      client.verify();
      return;
    }

    setTimeout(() => {
      if (!client.verified && !client.verifying) {
        Logger.info(`Client connection blocked, reason: Not send verification packet`);
        client.sendConnection(statusCode.error);
        client.destroy();
      }
    }, config.client.verification.timeout);
  }
}
