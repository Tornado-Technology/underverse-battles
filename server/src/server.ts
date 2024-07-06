import { createServer, Server as NetServer, Socket } from 'net';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import fs from 'fs';
import Client, { socketType } from './concepts/client/client.js';
import Packet from './packet/packet.js';
import { statusCode } from './status.js';
import Logger from './util/logging.js';
import config from './config.js';
import { Address } from './util/address.js';

/**
 * The main class of the server, is actually the entry point
 * Creates clients and process information from them, before the `run` method,
 * load the `loadInitializers` modules.
 */
export default class Server {
  /**
   * Current `NetServer` instance.
   */
  private readonly instance: NetServer;
  private readonly address: Address;

  constructor(ip: string, port: number) {
    // Create a server instance by binding the wiretap function
    // to the server context to have access inside the method
    // to local fields and methods
    this.instance = createServer(this.connectionListener.bind(this));
    this.address = new Address(ip, port);
  }

  public async run(): Promise<void> {
    // We're return promise to wait until the server is finally up and running
    return new Promise((resolve, reject) => {
      if (this.instance.listening) {
        // If we run the same server 2 times, this is a serious error
        reject(new Error('Attempt start an already running server'));
      }
  
      // Start listening to the selected address 
      this.instance.listen(this.address.port, () => {
        Logger.info(`Server started on ${this.address}`);
        resolve();
      });
    });
  }

  private connectionListener(socket: Socket) {
    const client = Client.create(socket, socketType.tcp);
    Logger.info(`${client} connected`);
    this.verifyClient(client);

    socket.on('data', async data => {
      await Packet.parse(client, data);
    });

    socket.on('close', async _ => {
      Logger.info(`${client} disconnected`);
      await Client.remove(client);
    });

    socket.on('error', async error => {
      // We will work out this error separately,
      // since forcible closing of the socket is normal
      if (error.message.includes('ECONNRESET')) {
        Logger.info(`${client} violently disconnected`);
        await Client.remove(client);
        return;
      }

      Logger.error(`${client} error handled: ${error.stack}`);
      await Client.remove(client);
    });
  }

  /**
   * Load all files from `src/initializers`.
   */
  public async loadInitializers(): Promise<void> {
    // Get current directory, for us `src`
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
