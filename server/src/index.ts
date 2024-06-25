import { ApiCommand, ApiCommandAccess } from './api/command.js';
import { ApiServer } from './api/server.js';
import config from './config.js';
import Server from './server.js';

const { enabled, port, ip } = config.api;

const server = new Server();
server.loadInitializers().then(() => {
  server.run();
});

// Run Api server if it's enabled
if (enabled) {
  const apiServer = new ApiServer(ip, port);

  // Add test command
  apiServer.registerCommand(new ApiCommand(
    '/test',
    ApiCommandAccess.Guest,
    (cmd, _req, res, _url, method) => {
      if (method !== 'GET') {
        cmd.send(res, {
          message: 'Fuck you <3',
        });
        return;
      }

      cmd.send(res, {
        message: 'Hello from server!'
      });
    })
  );

  apiServer.run();
}
