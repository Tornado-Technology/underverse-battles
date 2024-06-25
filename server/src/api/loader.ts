import { readdirSync } from 'fs';
import Logger from '../util/logging.js';
import { ApiServer } from './server.js';
import { ApiCommand } from './command.js';

export class ApiCommandLoader {
  private readonly server: ApiServer;
  private readonly path: string;
  
  constructor(server: ApiServer, path: string) {
    this.server = server;
    this.path = path;
  }

  public async load() {
    Logger.info('Starting loading api commands...');

    for (const file of readdirSync(this.path)) {
      if (!file.endsWith('.js'))
        continue;
  
      const value = await import(`file://${this.path}/${file}`);
      const command: ApiCommand = value.command;
      this.server.registerCommand(command);

      Logger.info(`Loaded ${command.id} command!`)
    }
  }
}