import App from '../app.js';
import config from '../config.js';

const pingInterval = setInterval(() => {
  App.clients.forEach((client) => {
    client.sendPing();
  })
}, config.client.pingInterval);

App.pingStartTime = new Date().getTime();
App.pingInterval = pingInterval;
