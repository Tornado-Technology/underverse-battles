import { IncomingMessage, ServerResponse } from 'http';
import { tokenAccess } from '../database/schemas/token';

type apiCommandCallback = (
    cmd: ApiCommand,
    req: IncomingMessage,
    res: ServerResponse,
    url: URL,
    method: string | undefined,
  ) => void;

export class ApiCommand {
  public readonly id: string; 
  public readonly access: apiCommandAccess;
  public readonly tokenAccess: tokenAccess;
  public readonly callback: apiCommandCallback; 

  constructor(id: string, access: apiCommandAccess, tokenAccess: tokenAccess, callback: apiCommandCallback) {
    this.id = id;
    this.access = access;
    this.tokenAccess = tokenAccess;
    this.callback = callback;
  }

  public run(req: IncomingMessage, res: ServerResponse, url: URL) {
    this.callback(this, req, res, url, this.getMethod(req));
  }

  public send(res: ServerResponse, data: object, statusCode: number = 200) {
    res.statusCode = statusCode;
    res.write(JSON.stringify(data));
    res.end();
  }

  protected getMethod(req: IncomingMessage): string | undefined {
    return req.method;
  }
}

export enum apiCommandAccess {
  Guest,
  Authorized,
}