import { Account } from '../schemas/account.js';
import Client from '../concepts/client.js';
import Logger from '../util/logging.js';
import App from '../app.js';

export const handlePacket = async (client: Client, data: any) => {
  const index = data.index.toLowerCase();

  switch (index) {
    case 'ping':
      client.sendPong(data.time);
      break;

    case 'pong':
      client.ping = Date.now() - data.time;
      break;

    case 'eval':
      if (client?.account.type !== 'developer') {
        Logger.warn(`Client ${client.account.username ?? client.uuid} try to use eval command!`);
      }

      try {
        eval(data.command);
      } catch (exception) {
        Logger.error(`Eval execution failed: ${exception}`);
      }
      break;

    case 'register':
      break;

    case 'login':
      try {
        const account = await Account.login(data.username, data.password);
        await client.login(account);
        client.onLogin();
        Logger.info(`Client login: ${client?.account.username}`)
      } catch (exception) {
        Logger.error(`Account login failed: ${exception}`);
      }
      break;

    case 'logout':
      if (!client.isLogin) {
        client.logout();
        break;
      }
      // TODO: Make status code
      client.sendLogout(304);
      break;

    case 'changePassword':
      break;

    case 'changeEmail':
      break;

    case 'changeUsername':
      break;

    case 'changeNickname':
      break;

    case 'deleteAccount':
      break;

    case 'confirm':
      break;

    default:
      Logger.warn(`Handled unknown command index: ${index}`);
      break;
  }
}