import { Account } from '../schemas/account.js';
import { send as mailSend } from '../util/mail.js';
import Client from '../concepts/client.js';
import Logger from '../util/logging.js';
import App from '../app.js';

export const handlePacket = async (client: Client, data: any) => {
  const index: string = data.index ?? '';

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

    case 'login':
      try {
        const account = await Account.login(data.username, data.password);
        await client.tryLogin(account);
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
      client.sendLogout(App.status.accountNotFound);
      break;

    case 'register':
      try {
        const status = await Account.infoValidate(data.username, data.password, data.email);
        if (status !== App.status.success) {
          client.sendRegister(status);
          return;
        }

        client.startVerification(async (status) => {
          if (status != App.status.success) {
            client.sendRegister(status);
            return;
          }

          try {
            const account = await Account.register(data.username, data.password, data.email);
            await client.register(account);
          } catch (exception) {
            client.sendRegister(App.status.unknownError);
            Logger.error(`Account registration failed: ${exception}`)
          }
        });
      } catch (exception) {
        Logger.error(`Account registration failed: ${exception}`);
      }

      await mailSend(data.email, 'Registration confirmation', '', `
          <div color=black>  
            <p>
              Hi <b>${data.username}</b>,<br>
              Heeey! Thanks for registering an account for <b>Underverse Battles</b><br>
              But you still have to confirm it by entering the code.<br>
              Your personal code: <b>${client.verificationCode}</b><br>
              Hurry up! In 5 minutes your code will go to the anti-void where no one will find it!<br>
            </p>
          </div>
        `);
      break;

    case 'changeEmail':
      break;

    case 'changePassword':
      break;

    case 'changeUsername':
      if (!client.isLogin) {
        client.sendChangeUsername(App.status.unknownError);
        break
      }
      // TODO: Make validation
      client.account.username = data.username;
      client.sendChangeUsername(App.status.success);
      break;

    case 'changeNickname':
      if (!client.isLogin) {
        client.sendChangeNickname(App.status.unknownError);
        break
      }
      // TODO: Make validation
      client.account.nickname = data.nickname;
      client.sendChangeNickname(App.status.success);
      break;

    case 'deleteAccount':
      client.startVerification((status) => {
        if (status !== App.status.success) {
          client.sendDeleteAccount(status);
          return;
        }

        try {
          client.deleteAccount();
          client.sendDeleteAccount(App.status.success);
        } catch (exception) {
          client.sendDeleteAccount(App.status.unknownError);
          Logger.error(`Account delete failed: ${exception}`);
        }
      });

      await mailSend(client.account.email, 'Registration confirmation', '', `
        <div color=black>  
          <p>
            Hi <b>${client.account.username}</b>,<br>
            Heeey! We were told that you would like to <strong>DELETE YOU ACCOUNT</strong>.<br>
            We reminde you that this is an irrevesible operation and the account can no longer be restored.<br>
            But you still have to confirm it by entering the code.<br>
            Your personal code: <b>${client.verificationCode}</b><br>
            Hurry up! In 5 minutes your code will go to the anti-void where no one will find it!<br>
          </p>
        </div>
      `);
      break;

    case 'verification':
      let status = App.status.success;
      if (!data.code) {
        status = App.status.verificationTimeHasExpired;
      }

      if (data.code !== client.verificationCode) {
        status = App.status.verificationCodeIncorrect;
      }

      await client.verificationCodeCallback(status);
      client.clearVerificationCode();
      break;

    default:
      Logger.warn(`Handled unknown command index: ${index}`);
      break;
  }
}