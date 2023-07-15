import Server from './server.js';

const server = new Server();
server.loadInitializers().then(() => {
  server.run();
});
