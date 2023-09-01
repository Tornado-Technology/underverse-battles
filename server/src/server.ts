import { createServer, Server as NetServer, Socket } from 'net';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import fs from 'fs';
import Client, { socketType } from './concepts/client/client.js';
import Packet from './packet/packet.js';
import { statusCode } from './status.js';
import Logger from './util/logging.js';
import config from './config.js';

const { ip, port } = config.main;

export default class Server {
  private netServer: NetServer = null;

  public run() {
    this.netServer = createServer(this.connectionListener.bind(this));
    this.netServer.listen(Number(port), () => {
      Logger.info(`Server started on ${ip}:${port}`);
    });
  }

  private connectionListener(socket: Socket): void {
    const client = Client.create(socket, socketType.tcp);
    Logger.info(`Client ${client.uuid} connected`);
    this.verifyClient(client);

    socket.on('data', async (data) => {
      await Packet.parse(client, data);
    });

    socket.on('close', async () => {
      Logger.info(`Client ${client.uuid} disconnected`)
      await Client.remove(client);
    });

    socket.on('error', (error) => {
      if (error.message.includes('ECONNRESET')) {
        Logger.info('Socket violently disconnected');
        return;
      }

      Logger.error(`Socket error handled: ${error.stack}`);
    });
  }

  public async loadInitializers(): Promise<void> {
    const directory = dirname(fileURLToPath(import.meta.url));
    const initFiles = fs.readdirSync(`${directory}/initializers`, 'utf8');

    for (let i = 0; i < initFiles.length; i++) {
      const file = initFiles[i];
      Logger.info(`Initialize: ${file}...`);
      await import(`file://${directory}/initializers/${file}`);
    }
    Logger.info('Initialize done');
  }

  private verifyClient(client: Client): void {
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
