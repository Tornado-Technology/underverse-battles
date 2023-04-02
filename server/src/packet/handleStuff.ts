import { send as mailSend } from '../util/mail.js';
import Client, { state } from '../concepts/client.js';
import {state as fightState, target} from '../game/fight.js';
import Logger from '../util/logging.js';
import App from '../app.js';
import { infoValidate, login, register } from '../schemas/account.js';
import { versions } from '../config.js';
import Matchmaker from '../util/matchmaker.js';

export const handlePacket = async (client: Client, data: any) => {
  const index: string = data.index ?? '';

  switch (index) {
    case 'information':
      if (!App.config.client.verification.enabled) {
        Logger.debug('Client allowed, verification disabled');
        break;
      }
      {
        client.verifying = true;
        const info = JSON.parse(data.information);
        const hash = versions[info.build][info.version];

        if (!hash) {
          Logger.warn(`Client version "${info.version}" or build "${info.build}" is not registered on the server`);
          client.verifying = false;
          client.sendConnection(App.status.unknownError);
          client.destroy();
          break;
        }

        if (hash !== info.hash) {
          Logger.warn(`Client hash not match, needed: "${hash}", provided: "${info.hash}"`);
          client.verifying = false;
          client.sendConnection(App.status.unknownError);
          client.destroy();
          break;
        }

        client.verifying = false;
        client.verify();
        client.sendConnection(App.status.success);
      }
      break;

    case 'ping':
      client.sendPong(data.time);
      break;

    case 'pong':
      client.ping = Date.now() - data.time;
      break;

    case 'eval':
      if (client?.account.type !== 'developer') {
        Logger.warn(`Client ${client.account.username ?? client.uuid} try to use eval command!`);
        break;
      }

      try {
        eval(data.command);
      } catch (exception) {
        Logger.error(`Eval execution failed: ${exception}`);
      }
      break;

    case 'login':
      try {
        const account = await login(data.username, data.password);
        await client.tryLogin(account);
        client.onLogin();
        Logger.info(`Client login: ${client?.account.username}`)
      } catch (exception) {
        Logger.error(`Account ${data.username} login failed: ${exception}`);
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
        const status = await infoValidate(data.username, data.password, data.email);
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
            const account = await register(data.username, data.password, data.email);
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
      // TODO: Make changing email
      break;

    case 'changePassword':
      if (!client.isLogin) {
        client.sendChangePassword(App.status.unknownError);
        break
      }
      // TODO: Make validation
      await client.setPassword(data.password);
      client.sendChangePassword(App.status.success)
      break;

    case 'changeUsername':
      if (!client.isLogin) {
        client.sendChangeUsername(App.status.unknownError);
        break
      }
      // TODO: Make validation
      await client.setUsername(data.username);
      client.sendChangeUsername(App.status.success);
      break;

    case 'changeNickname':
      if (!client.isLogin) {
        client.sendChangeNickname(App.status.unknownError);
        break
      }
      // TODO: Make validation
      await client.setNickname(data.nickname);
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

    // Fight stuff
    case 'fightJoin':
      try {
        const clients = Matchmaker.findClientsWithState(state.waitFight);
        if (client.account === null || !client.verified) {
          client.sendFightJoin(App.status.unknownError, undefined);
          Logger.info('Fight join failed, client not logged');
          break;
        }

        client.fight.setCharacter(data.characterId, data.skinId);

        if (clients.length < 1) {
          client.setState(state.inMenu);
          client.sendFightJoin(App.status.success, undefined);
          Logger.info('Clients not found, wait...');
          break;
        }

        const opponent = clients[clients.length - 1];
        Matchmaker.makeMatch(client, opponent);
      } catch (exception) {
        client.setState(state.inMenu);
        client.sendFightJoin(App.status.unknownError, undefined);
        Logger.info(`Fight join failed, reason: ${exception.stack}`);
      }
      break;

    case 'fightJoinReject':
      client.setState(state.inMenu);
      break;

    case 'fightJoined':
      client.fight.instance.sync();
      break;

    case 'fightAction':
      client.fight.instance?.setAction(client, data.action);
      break;

    case 'fightPower':
      client.fight.instance?.setPower(client, data.power);
      break;

    case 'fightSpecialAction':
      // TODO: ADD SOMETHING { data.playerId }
      break;

    case 'fightHealAction':
      client.fight.instance?.addHp(client, data.hp);
      client.fight.instance?.getOtherClient(client)?.sendFightBattleEnd();
      break;

    case 'fightSkip':
      // TODO: ADD SOMETHING { data.playerId }
      break;

    case 'fightHp':
      client.fight.instance?.setHp(client, data.hp);
      break;

    case 'fightSoul':
      client.fight.instance?.setSoulData(client, data.x, data.y, data.angle, data.ability);
      break;

    case 'fightColliderSoul':
      if (client.fight.instance.state === fightState.battle) {
        client.fight.instance?.addMana(client, 2);
        client.fight.instance?.getOtherClient(client)?.sendFightCollider(target.opponent);
      }
      break;

    case 'fightKill':
      client.fight.instance?.finish(client.fight.instance?.getOtherClient(client));
      break;

    case 'fightDamage':
      client.fight.instance?.removeHp(client, data.damage);
      client.fight.instance?.addMana(client.fight.instance?.getOtherClient(client), data.damage);
      break;

    case 'fightStun':
      if (client.fight.instance.state === fightState.battle) {
        client.fight.instance.getOtherClient(client)?.sendFightStun(target.opponent);
      }
      break;

    case 'battleFinish':
      if (client.fight.instance?.inactiveClient === client) {
        client.fight.instance?.battleFinish();
      }
      break;

    default:
      Logger.warn(`Handled unknown command index: ${index}`);
      break;
  }
}
