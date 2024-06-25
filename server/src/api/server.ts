import { IncomingMessage, Server, ServerResponse, createServer } from 'http';
import { ApiCommand, ApiCommandAccess } from './command.js';

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

    private listener(req: IncomingMessage, res: ServerResponse) {
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

        if (!this.hasAccess(command, url)) {
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

    private hasAccess(command: ApiCommand, url: URL): boolean {
        switch (command.access) {
            case ApiCommandAccess.Guest:
                return true;

            case ApiCommandAccess.Authorized:
                return this.hasToken(url.searchParams.get('token'));

            default:
                throw new Error(`Unknown ApiCommandAccess ${command.access}`);
        }
    }

    private hasToken(token: string | null): boolean {
        if (!token)
            return false;

        return true;
    }
}
