import { config } from './config.js';
import Logger from './util/logging.js';
import Client from './concepts/client.js';
import Fight from './fight/fight.js';

export default class App {
  public static readonly fights: Fight[] = [];
  public static readonly clients: Client[] = [];

  public static database: any;
  public static pingStartTime: number;
  public static pingInterval: NodeJS.Timeout;

  private static __config: config = null;

  public static readonly status = {
    socketClosed: 0,
    success: 100,
    unknownAccountError: 301,
    accountExists: 305,
    profileNotFound: 317,
  };

  public static applyConfig(config: config): void {
    this.__config = config;
    Logger.info(`${config.environment} config loaded`);
  }

  public static get config() {
    return this.__config;
  }
}
