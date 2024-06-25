import { IncomingMessage, ServerResponse } from 'http';

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
  public readonly callback: apiCommandCallback; 

  constructor(id: string, access: apiCommandAccess, callback: apiCommandCallback) {
    this.id = id;
    this.access = access;
    this.callback = callback;
  }

  public run(req: IncomingMessage, res: ServerResponse, url: URL) {
    this.callback(this, req, res, url, this.getMethod(req));
  }

  public send(res: ServerResponse, data: object) {
    res.statusCode = 200;
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