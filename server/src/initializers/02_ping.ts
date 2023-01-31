import App from '../app.js';

const pingInterval = setInterval(() => {
  App.clients.forEach((client) => {
    client.sendPing();
  })
}, App.config.client.pingInterval);

App.pingStartTime = new Date().getTime();
App.pingInterval = pingInterval;
