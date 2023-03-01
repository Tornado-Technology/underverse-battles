import {createServer, Server as NetServer, Socket} from 'net';
import {dirname} from 'path';
import {fileURLToPath} from 'url';
import fs from 'fs';
import './config.js';
import Client, { socketType } from './concepts/client.js';
import Packet from './packet/packet.js';
import Logger from './util/logging.js';
import App from './app.js';

const { ip, port } = App.config.main;

class Server {
  private netServer: NetServer = null;

  public init(): void {
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

    socket.on('error', (exception) => {
      if (exception.message.includes('ECONNRESET')) {
        Logger.info('Socket violently disconnected');
        return;
      }
      Logger.error(`Socket error handled: ${exception}`);
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
    if (!App.config.client.verification.enabled) {
      client.verify();
    }

    setTimeout(() => {
      if (!client.verified && !client.verifying) {
        Logger.info(`Client connection blocked, reason: Not send verification packet`);
        client.sendConnection(App.status.unknownError);
        client.destroy();
      }
    }, App.config.client.verification.timeout);
  }
}

const server = new Server();
server.loadInitializers().then(() => {
  server.init();
});

