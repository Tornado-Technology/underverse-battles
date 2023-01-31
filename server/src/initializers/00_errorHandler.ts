import Logger from '../util/logging.js';

process.on('uncaughtException', (error) => {
  Logger.fatal(error.stack);
  process.exit();
});
