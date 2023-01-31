import { createRequire } from 'module';
import Logger from '../util/logging.js';
import App from '../app.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');

const { connect, connection } = mongoose;
const url = App.config.database.address;

let exportDB = null;

if (!App.config.database.enabled) {
  Logger.info('Database disabled');
} else {
  // Connecting to MongoDB
  connect(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
    useCreateIndex: true
  });

  exportDB = new Promise((resolve) => {
    connection.once('open', () => {
      // Set collections
      Logger.info('Database connected');
      resolve(connection);
    });

    connection.on('error', (error) => {
      throw new Error(`Database connection failed, reason: ${error}`);
    });
  });
}

exportDB?.then((connection) => {
  App.database = connection;
});
