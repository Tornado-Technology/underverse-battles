import Logger from '../util/logging.js';
import App from '../app.js';
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

const mongoose = require('mongoose');
// import * as mongoose from 'mongoose';
mongoose.set('strictQuery', false);
const { connect, connection } = mongoose;

let database;

if (App.config.database.enabled) {
  connect(App.config.database.address);
  const db = connection;

  database = new Promise((resolve) => {
    db.once('open', () => {
      Logger.info(`Database connected: ${App.config.database.address}`);
      resolve(db);
    });

    db.on('error', (error) => {
      throw new Error(`Database error: ${error}`);
    });
  });
} else {
  Logger.info('Database disabled');
}

App.database = database;
