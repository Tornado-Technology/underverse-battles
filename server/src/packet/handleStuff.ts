import { Account, accountType, login, register } from '../database/schemas/account.js';
import { actionType, state as fightState, target } from '../game/fight/fight.js';
import { send as mailSend} from '../util/mail.js';
import Client, { state } from '../concepts/client/client.js';
import { statusCode } from '../status.js';
import { versions, connectionOptions } from '../config.js';
import Matchmaker from '../util/matchmaker.js';
import Logger from '../util/logging.js';
import { hashPassword } from '../util/encrypting.js';
import { infoValidate, validatePassword, validateUsername, validateNickname } from '../database/validation.js';

export const handlePacket = async (client: Client, data: any) => {
  const index: string = data.index ?? '';

  switch (index) {
    case 'information':
      {
        client.verifying = true;
        const info = JSON.parse(data.information);
        const admitted = versions[info.build][info.version];

        if (info?.os_info) {
          const osInfo = JSON.parse(info.os_info);
          client.hardAddress = osInfo?.udid;
        }

        if (!admitted) {
          Logger.warn(`Client version "${info.version}" or build "${info.build}" is not registered on the server`);
          client.verifying = false;
          client.sendConnection(statusCode.updateRequired);
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
      client.fight?.response();
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
      } catch (error) {
        Logger.error(`Eval execution failed: ${error.stack}`);
      }
      break;

    case 'login':
      try {
        const account = await login(data.username, data.password);
        await client.tryLogin(account);
        await client.onLogin();
        Logger.info(`Client login: ${client?.username}`)
      } catch (error) {
        Logger.error(`Account ${data.username} login failed: ${error}, ${error.stack ?? ''}`);
        client.sendLogin(error);
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

        await client.startVerification(async (status) => {
          if (status !== statusCode.success) {
            client.sendRegister(status);
            return;
          }

          try {
            const account = await register(data.username, data.password, data.email);
            await client.register(account);
          } catch (error) {
            client.sendRegister(statusCode.error);
            Logger.error(`Account registration failed: ${error.stack}`)
          }
        });
      } catch (error) {
        Logger.error(`Account registration failed: ${error.stack}`);
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

      await client.startVerification((status) => {
        if (status !== statusCode.success) {
          client.sendChangeEmail(status);
          return;
        }

        try {
          client.setEmail(data.email);
          client.sendChangeEmail(statusCode.success);
        } catch (error) {
          client.sendChangeEmail(statusCode.error);
          Logger.error(`Account change email failed: ${error.stack}`);
        }
      });

      await mailSend(client.account.email, 'Account change email confirmation', '', `
        <div color=black>  
          <p>
            Hi <b>${client.account.username}</b>,<br>
            Heeey! We heard that you have a desire to change your mail.<br>
            For the security of your account, we sent you this email.
            <strong>If it was not you</strong>, please contact the <a href="https://discord.gg/2Nuas5NKj8">technical support</a> of the game as soon as possible to ensure the safety of your account.<br>
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

      const nicknameValidation = await validateNickname(data.nickname);
      if (nicknameValidation !== statusCode.success) {
        client.sendChangeNickname(nicknameValidation);
        break;
      }

      await client.setNickname(data.nickname);
      client.sendChangeNickname(statusCode.success);
      break;

    case 'restorePassword':
      {
        const passwordValidation = validatePassword(data.password);
        if (passwordValidation !== statusCode.success) {
          client.sendRestorePassword(passwordValidation);
          break;
        }

        const { identifier, password } = data;
        const account = await Account.findOne({ username: identifier }) ?? await Account.findOne({ email: identifier });
        if (!account) {
          client.sendRestorePassword(statusCode.databaseAccountNotExists);
          break;
        }

        await client.startVerification(async (status) => {
          if (status !== statusCode.success) {
            client.sendRestorePassword(status);
            return;
          }

          account.password = await hashPassword(password);
          await account.save();

          client.sendRestorePassword(statusCode.success);
        });

        await mailSend(account.email, 'Account restore password', '', `
          <div color=black>  
            <p>
              Hi <b>${account.username}</b>,<br>
              We have been whispered that you have forgotten your password.<br>
              But we need confirmation that the intruders are not trying to ruin your life.<br>
              <strong>If it was not you</strong>, please contact the <a href="https://discord.gg/2Nuas5NKj8">technical support</a> of the game as soon as possible to ensure the safety of your account.<br>
              If it is you, still have to confirm it by entering the code.<br>
              Your personal code: <b>${client.verificationCode}</b><br>
              Hurry up! In 5 minutes your code will go to the anti-void where no one will find it!<br>
            </p>
          </div>
        `);
      }
      break;

    case 'deleteAccount':
      await client.startVerification((status) => {
        if (status !== statusCode.success) {
          client.sendDeleteAccount(status);
          return;
        }

        try {
          client.deleteAccount();
          client.sendDeleteAccount(statusCode.success);
        } catch (error) {
          client.sendDeleteAccount(statusCode.error);
          Logger.error(`Account delete failed: ${error.stack}`);
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
      if (!data.code || data.code !== client.verificationCode) {
        status = statusCode.databaseVerificationWrongCode;
      }

      await client.verificationCodeCallback(status);
      client.clearVerificationCode();
      break;

    // Fight stuff
    case 'fightJoin':
      try {
        if (!connectionOptions["MatchmakerIsWorking"]) {
          Logger.info('Fight join locked');
          break;
        }

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
        Logger.info('Waiting players: ');
        clients.forEach(element => {
          Logger.info(element.username);
        });
        if (client.fight.hasInstance) {
          Logger.info(`The client ${client.username} is trying to start a battle during other battle`);
          break;
        }
        if (opponent.fight.hasInstance) {
          Logger.info(`The client ${opponent.username} is trying to start a battle during other battle`);
          break;
        }
        if (client.username === opponent.username) {
          client.sendFightJoin(statusCode.error, undefined);
          Logger.info('The client is trying to start a battle with himself:');
          Logger.info(client.username);
          Logger.info(opponent.username);
          break;
        }
        
        client.setState(state.inFight);
        opponent.setState(state.inFight);
        
        Matchmaker.makeMatch(client, opponent);
      } catch (error) {
        client.setState(state.inMenu);
        client.sendFightJoin(statusCode.error, undefined);
        Logger.info(`Fight join failed, reason: ${error.stack}`);
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
      client.fight.instance?.setAction(client, actionType.specialAttack);
      client.fight.instance?.setSpecialActionCharge(client, 0);
      break;
    
    case 'fightExtraAction':
      client.fight.instance?.setExtraAction(client);
      break;

    case 'fightHealAction':
      await client.fight.instance?.addHp(client, data.hp);
      break;

    case 'fightSkip':
      client.fight.instance?.setAction(client, actionType.skip);
      break;

    case 'fightHp':
      await client.fight.instance?.setHp(client, data.hp);
      break;
    
    case 'fightMana':
        client.fight.instance?.addMana(client, data.mana);
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
      await client.fight.instance?.finish(client.fight.instance?.getOtherClient(client));
      break;

    case 'fightDamage':
      {
        const { damage } = data;
        const fight = client.fight.instance;
        const source = fight?.getOtherClient(client);

        await fight?.removeHp(client, damage);
        fight?.addMana(source, damage);
        fight?.addSpecialActionCharge(source, damage * source?.fight.characterInfo.specialActionChargePerDamage);
      }
      break;

    case 'fightStun':
      if (client.fight.instance.state === fightState.battle) {
        client.fight.instance.getOtherClient(client)?.sendFightStun(target.opponent);
      }
      break;

    case 'battleFinish':
      if (data.initiative == 1) {
        client.fight.instance?.battleFinish(client, data.damage);
      }
      break;

    case 'fightLoaded':
      client.fight.instance?.sync();
      break;
    
    case 'battleCreateBorder':
      client.fight.instance?.transferDataFromClient(client, index, data);
      break;
    case 'battleCreateSoul':
      client.fight.instance?.transferDataFromClient(client, index, data);
      break;
    case 'battleCreateObject':
      client.fight.instance?.transferDataFromClient(client, index, data);
      Logger.debug(`PACKET ${index}: ${data}`);
      break;
    case 'battleReplaceObject':
      client.fight.instance?.transferDataFromClient(client, index, data);
      break;
    case 'battleChangeObjectData':
      client.fight.instance?.transferDataFromClient(client, index, data);
      Logger.debug(`PACKET ${index}: ${data}`);
      break;
    case 'battleDestroyObject':
      client.fight.instance?.transferDataFromClient(client, index, data);
      Logger.debug(`PACKET ${index}: ${data}`);
      break;
    case 'battleDestroyByEdit':
      client.fight.instance?.transferDataFromClient(client, index, data);
      break;
    default:
      Logger.warn(`Handled unknown command index: ${index}, data: ${data}`);
      break;
  }
}
