import Logger from './logging.js';
import App from '../app.js';
import { createRequire } from 'module';
import { Connection } from 'mongoose';
const require = createRequire(import.meta.url);

const mongoose = require('mongoose');
// import * as mongoose from 'mongoose';
mongoose.set('strictQuery', false);

let database: Connection;

export const connect = async () => {
  await mongoose.connect(App.config.database.address, {
    autoIndex: false
  });

  new Promise((resolve) => {
    const connection = mongoose.connection;

    connection.on('open', () => {
      Logger.info('Database connected');
      resolve(connection);
    });

    connection.on('error', (error) => {
      throw new Error(`Database connection failed, reason: ${error}`);
    });
  }).then((connection: Connection) => {
    database = connection;
  });
}

if (App.config.database.enabled) {
  connect();
} else {
  Logger.info('Database disabled');
}

export { database };
