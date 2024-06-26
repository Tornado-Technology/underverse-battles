
import * as readline from 'readline';

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
