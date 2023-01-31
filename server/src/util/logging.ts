import { appendFile } from 'fs';
import App from '../app.js';

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
    appendFile(`./logs/${file}.txt`, `${result.replace(stylingRegex, '')}\n`, () => {});
  }

  public static info(message: string, file: string = 'info'): void {
    this.log(message, 'Info', 'log', file);
  }

  public static warn(message: string, file: string = 'warn'): void {
    this.log(message, 'Warn', 'warn', file);
  }

  public static error(message: string, file: string = 'error'): void {
    this.log(message, 'Error', 'error', file);
  }

  public static debug(message: string, file: string = 'debug'): void {
    if (App.config.environment === 'development') {
      this.log(message, 'Debug', 'debug', file);
    }
  }

  public static fatal(message: string, file: string = 'crush'): void {
    this.log(message, 'Fatal', 'error', file);
  }
}
