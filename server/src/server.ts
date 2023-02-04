import { createServer, Socket, Server as NetServer } from 'net';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';
import './config.js';
import Client from './concepts/client.js';
import Packet from './packet/packet.js';
import Logger from './util/logging.js';
import App from './app.js';

const { ip, port } = App.config.main;

class Server {
  private netServer: NetServer = null;

  public init(): void {
    this.netServer = createServer(this.connectionListener);
    this.netServer.listen(Number(port), () => {
      Logger.info(`Server started on ${ip}:${port}`);
    });
  }

  private connectionListener(socket: Socket): void {
    const client = Client.create(socket, 'tcp');
    Logger.info(`Client ${client.uuid} connected`)

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
}

const server = new Server();
server.loadInitializers().then(() => {
  server.init();
});
