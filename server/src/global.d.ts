import { statusCode } from './status.js';

declare global {
  var app: App;
  var commands: globalCommands;
}

interface globalCommands {
  context: object | undefined,
  ban: (target: string, executor: string, reason: string, ip: string | null, hardAddress: string | null) => Promise<statusCode>;
  banUsername: (username: string, executor: string, reason: string, ip: string | null, hardAddress: string | null) => Promise<statusCode>;
}