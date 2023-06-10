import { appendFile, mkdirSync, existsSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import config from '../config.js';

const directory = dirname(fileURLToPath(import.meta.url));
const logsDirectory = `${directory}/../../logs`;

if (!existsSync(logsDirectory)) {
  mkdirSync(logsDirectory);
}

export default class Logger {
  private static log(message: string, prefix: string, method: string, file: string): void {
    switch (message) {
      case 'undefined':
        message = 'undefined';
        break;

      case 'object':
        message = `${JSON.stringify(message)}`;
        break;

      default:
        message = `${message.toString()}`;
        break;
    }

    const date = new Date();
    const result = `[${date.toLocaleDateString()} ${date.toLocaleTimeString()}][${prefix}] ${message}`;
    console[method](result);
    const stylingRegex = /[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><]/g;
    appendFile(`${logsDirectory}/${file}.txt`, `${result.replace(stylingRegex, '')}\n`, () => {});
  }

  public static info(message: string, file = 'info') {
    this.log(message, 'Info', 'log', file);
  }

  public static warn(message: string, file = 'warn') {
    this.log(message, 'Warn', 'warn', file);
  }

  public static error(message: string, file = 'error') {
    this.log(message, 'Error', 'error', file);
  }

  public static debug(message: string, file = 'debug') {
    if (config.environment === 'development') {
      this.log(message, 'Debug', 'debug', file);
    }
  }

  public static fatal(message: string, file = 'crush') {
    this.log(message, 'Fatal', 'error', file);
  }
}
