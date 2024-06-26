import { Connection } from 'mongoose';
import { createRequire } from 'module';
import Logger from '../util/logging.js';
import config from '../config.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');

mongoose.set('strictQuery', false);

const { connect, connection } = mongoose;

if (config.database.enabled) {
  connect(config.database.address);
  const db = connection;

  // Add here "const database ="
  // for database connection usage
  await new Promise<Connection>((resolve) => {
    db.once('open', () => {
      Logger.info(`Database connected: ${config.database.address}`);
      resolve(db);
    });

    db.on('error', (error) => {
      Logger.error(`Database error: ${error}`);
    });
  });

  // You can use database here, idk
  // database.db.dropCollection('my collection');
}

