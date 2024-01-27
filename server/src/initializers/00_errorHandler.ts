import Logger from '../util/logging.js';
import App from '../app.js';

process.on('exit', (code) => {
  App.fights.forEach(fight => {
    fight.finishInDraw();
  });
  Logger.info(`Server exit with code: ${code}`);
});

process.on('uncaughtException', (error) => {
  Logger.fatal(error.stack);
  process.exit();
});
