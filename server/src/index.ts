import { dirname } from 'path';
import { fileURLToPath } from 'url';
import { ApiServer } from './api/server.js';
import config from './config.js';
import Server from './server.js';
import { ApiCommandLoader } from './api/loader.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const { enabled, port, ip } = config.api;

const server = new Server();
await server.loadInitializers();
server.run();


// Run Api server if it's enabled
if (enabled) {
  const apiServer = new ApiServer(ip, port);
  const loader = new ApiCommandLoader(apiServer, `${__dirname}/api/commands/`);
  
  await loader.load();
  
  apiServer.run();
}
