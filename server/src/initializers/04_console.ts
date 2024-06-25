
import * as readline from 'readline';
import Logger from '../util/logging.js';

Logger.info('Starting the eval console...');

const rl = readline.createInterface(process.stdin, process.stdout);

rl.on('line', async (line) => {
  try {
    let result = eval(line);
    while (result instanceof Promise) {
      result = await result;
    }
    console.log(result);
  }
  catch (error) {
    console.error(error);
  }
});

Logger.info('> type right into the console to execute JS code in real time <');
