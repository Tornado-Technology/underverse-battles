import { IncomingMessage, Server, ServerResponse, createServer } from 'http';
import { ApiCommand, apiCommandAccess } from './command.js';
import { Token } from '../database/schemas/token.js';

export class ApiServer {
  private readonly ip: string;
  private readonly port: number;
  private readonly commands: Map<string, ApiCommand>;

  private instance?: Server;

  constructor(ip: string, port: number) {
    this.ip = ip;
    this.port = port;
    this.commands = new Map<string, ApiCommand>();
  }
  
  /**
   * Instantiate HTTP server and binding listener.
   */
  public run() {
    if (this.instance) {
      throw new Error('Multiply ApiServer run');
    } 

    this.instance = createServer(this.listener.bind(this));
    this.instance.listen(this.port, this.ip);
  }

  public registerCommand(command: ApiCommand) {
    if (this.commands.has(command.id)){
      throw new Error(`Command Id ${command.id} already registered`);
    }

    this.commands.set(command.id, command);
  }

  private async listener(req: IncomingMessage, res: ServerResponse) {
    const url = new URL(req.url, `http://${req.headers.host}`);
    const command = this.getCommand(url.pathname);

    if (!command) {
      res.statusCode = 404;
      res.write(JSON.stringify({
        error: 'No handler was found for the request',
      }));
      res.end();
      return;
    }

    const hasAccess = await this.hasAccess(command, url);
    if (!hasAccess) {
      res.statusCode = 403;
      res.write(JSON.stringify({
          error: 'No access to this method',
      }));
      res.end();
      return;
    }

    command.run(req, res, url);
  }

  private getCommand(id: string): ApiCommand | undefined {
    if (!this.commands.has(id))
      return undefined;

    return this.commands.get(id);
  }

  private async hasAccess(command: ApiCommand, url: URL): Promise<boolean> {
    if (apiCommandAccess.Guest) return true;

    if (apiCommandAccess.Authorized) {
      const token = url.searchParams.get('token');
      const instance = await Token.findOne({ token }).clone();

      if (!instance) return false;
      
      return command.tokenAccess <= instance.access;
    }

    throw new Error(`Unknown ApiCommandAccess ${command.access}`);
  }
}
