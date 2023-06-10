import { createRequire } from 'module';
import Logger from '../util/logging.js';
import config from '../config.js';
import App from '../app.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');

mongoose.set('strictQuery', false);

const { connect, connection } = mongoose;

let database = undefined;

if (config.database.enabled) {
  connect(config.database.address);
  const db = connection;

  database = new Promise((resolve) => {
    db.once('open', () => {
      Logger.info(`Database connected: ${config.database.address}`);
      resolve(db);
    });

    db.on('error', (error) => {
      Logger.error(`Database error: ${error}`);
    });
  });
} else {
  Logger.info('Database disabled');
}

App.database = database;
