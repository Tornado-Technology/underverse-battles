import { Account, accountType, infoValidate, login, register, validatePassword, validateUsername } from '../schemas/account.js';
import { state as fightState, target } from '../game/fight/fight.js';
import { send as mailSend } from '../util/mail.js';
import Client, { state } from '../concepts/client.js';
import { statusCode } from '../status.js';
import { versions } from '../config.js';
import Matchmaker from '../util/matchmaker.js';
import Logger from '../util/logging.js';
import App from '../app.js';

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
        if (info?.os_info) {
          const osInfo = JSON.parse(info.os_info);
          client.hardAddress = osInfo?.udid;
        }

        if (!hash) {
          Logger.warn(`Client version "${info.version}" or build "${info.build}" is not registered on the server`);
          client.verifying = false;
          client.sendConnection(statusCode.error);
          client.destroy();
          break;
        }

        if (hash !== info.hash) {
          Logger.warn(`Client hash not match, needed: "${hash}", provided: "${info.hash}"`);
          client.verifying = false;
          client.sendConnection(statusCode.error);
          client.destroy();
          break;
        }

        client.verifying = false;
        client.verify();
        client.sendConnection(statusCode.success);
      }
      break;

    case 'ping':
      client.sendPong(data.time);
      break;

    case 'pong':
      client.ping = Date.now() - data.time;
      break;

    case 'eval':
      if (client?.account.type !== accountType.developer) {
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

      client.sendLogout(statusCode.databaseAccountNotExists);
      break;

    case 'register':
      try {
        const status = await infoValidate(data.username, data.password, data.email);
        if (status !== statusCode.success) {
          client.sendRegister(status);
          return;
        }

        client.startVerification(async (status) => {
          if (status != statusCode.success) {
            client.sendRegister(status);
            return;
          }

          try {
            const account = await register(data.username, data.password, data.email);
            await client.register(account);
          } catch (exception) {
            client.sendRegister(statusCode.error);
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
      if (!client.isLogin) {
        client.sendChangeEmail(statusCode.error);
        break;
      }

      if (await Account.findOne({ email: data.email })) {
        client.sendChangeEmail(statusCode.databaseEmailBusy);
        break;
      }

      client.startVerification((status) => {
        if (status !== statusCode.success) {
          client.sendChangeEmail(status);
          return;
        }

        try {
          client.setEmail(data.email);
          client.sendChangeEmail(statusCode.success);
        } catch (exception) {
          client.sendChangeEmail(statusCode.error);
          Logger.error(`Account change email failed: ${exception}`);
        }
      });

      await mailSend(client.account.email, 'Account change email confirmation', '', `
        <div color=black>  
          <p>
            Hi <b>${client.account.username}</b>,<br>
            Heeey! We heard that you have a desire to change your mail.<br>
            For the security of your account, we sent you this email.
            <strong>If it was not you</strong>, please contact the <a href="https://discord.gg/2Nuas5NKj8">technical support</a> of the game as soon as possible to ensure the safety of your account .<br>
            If it is you, then confirm by entering the code.<br>
            Your personal code: <b>${client.verificationCode}</b><br>
            Hurry up! In 5 minutes your code will go to the anti-void where no one will find it!<br>
          </p>
        </div>
      `);
      break;

    case 'changePassword':
      if (!client.isLogin) {
        client.sendChangePassword(statusCode.error);
        break;
      }

      const passwordValidation = validatePassword(data.password);
      if (passwordValidation !== statusCode.success) {
        client.sendChangePassword(passwordValidation);
        break;
      }

      await client.setPassword(data.password);
      client.sendChangePassword(statusCode.success)
      break;

    case 'changeUsername':
      if (!client.isLogin) {
        client.sendChangeUsername(statusCode.error);
        break;
      }

      const usernameValidation = await validateUsername(data.username);
      if (usernameValidation !== statusCode.success) {
        client.sendChangeUsername(usernameValidation);
        break;
      }

      await client.setUsername(data.username);
      client.sendChangeUsername(statusCode.success);
      break;

    case 'changeNickname':
      if (!client.isLogin) {
        client.sendChangeNickname(statusCode.error);
        break;
      }

      const nicknameValidation = await validateUsername(data.username);
      if (nicknameValidation !== statusCode.success) {
        client.sendChangeNickname(nicknameValidation);
        break;
      }

      await client.setNickname(data.nickname);
      client.sendChangeNickname(statusCode.success);
      break;

    case 'deleteAccount':
      client.startVerification((status) => {
        if (status !== statusCode.success) {
          client.sendDeleteAccount(status);
          return;
        }

        try {
          client.deleteAccount();
          client.sendDeleteAccount(statusCode.success);
        } catch (exception) {
          client.sendDeleteAccount(statusCode.error);
          Logger.error(`Account delete failed: ${exception}`);
        }
      });

      await mailSend(client.account.email, 'Account delete confirmation', '', `
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
      let status = statusCode.success;
      if (data.code && data.code !== client.verificationCode) {
        status = statusCode.databaseVerificationWrongCode;
      }

      await client.verificationCodeCallback(status);
      client.clearVerificationCode();
      break;

    // Fight stuff
    case 'fightJoin':
      try {
        const clients = Matchmaker.findClientsWithState(state.waitFight);
        if (client.account === null || !client.verified) {
          client.sendFightJoin(statusCode.error, undefined);
          Logger.info('Fight join failed, client not logged');
          break;
        }

        client.fight.setCharacter(data.characterId, data.skinId);

        if (clients.length < 1) {
          client.setState(state.waitFight);
          client.sendFightJoin(statusCode.error, undefined);
          Logger.info('Clients not found, wait...');
          break;
        }

        const opponent = clients[clients.length - 1];
        if (client.fight.hasInstance || opponent.fight.hasInstance || client === opponent) {
          client.sendFightJoin(statusCode.error, undefined);
          break;
        }

        Matchmaker.makeMatch(client, opponent);
      } catch (exception) {
        client.setState(state.inMenu);
        client.sendFightJoin(statusCode.error, undefined);
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
      client.fight.instance?.setAction(client, 3);
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
