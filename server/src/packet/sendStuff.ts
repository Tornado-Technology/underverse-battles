import { Socket } from 'net';
import { socketType } from '../concepts/client/client.js';
import { IAccount } from '../database/schemas/account.js';
import { IProfile } from '../database/schemas/profile.js';
import { IStatistic } from '../database/schemas/statistic.js';
import { target } from '../game/fight/fight.js';
import ClientFight from '../concepts/client/clientFight.js';
import Packet from './packet.js';
import App from '../app.js';
import { statusCode } from '../status.js';
import config from '../config.js';

const generateNickname = (): string => {
  return `Player${Math.randomRange(0, 1000)}`;
};

export default class SendStuff {
  public readonly socket: Socket;
  public readonly type: socketType;
  public readonly uuid: string;

  // MongoDB schemes
  public account: IAccount;
  public profile: IProfile;
  public statistic: IStatistic;

  // Client components
  public fight: ClientFight = null;
  public halfpack: (Buffer | null) = null;
  public hardAddress: (string | null) = null;

  protected _nickname: string = generateNickname();

  constructor(socket: Socket, type: socketType, uuid: string) {
    this.socket = socket;
    this.type = type;
    this.uuid = uuid;
  }

  public send(index: string, data: any = {}): void {
    data.index = index;
    this.cast(data);
    this.socket.write(Packet.build(data));
  }

  private cast(object: object) {
    if (Array.isArray(object)) {
      object.forEach((value, i) => {
        if (value?.constructor.name === 'Date') {
          object[i] = value.getTime();
          return;
        }
  
        if (value?.constructor.name === 'ObjectId') {
          object[i] = value.toString();
          return;
        }
  
        if (value && typeof value === 'object') {
          this.cast(value);
        }
      });
    }


    Object.keys(object).forEach(key => {
      const value = object[key];

      if (value?.constructor.name === 'Date') {
        object[key] = value.getTime();
        return;
      }

      if (value?.constructor.name === 'ObjectId') {
        object[key] = value.toString();
        return;
      }

      if (value && typeof value === 'object') {
        this.cast(value);
      }
    });
  }

  public sendConnection(code: statusCode): void {
    this.send('connection', {
      code,
    });
  }

  // MongoDB packets
  protected sendSchemes(): void {
    this.send('schemes', {
      ...this.schemesPack,
    });
  }

  public sendLogin(status: statusCode): void {
    this.send('login',{
      status,
      ...this.schemesPack,
    })
  }

  public sendLogout(status: statusCode): void {
    this.send('logout', {
      status,
    });
  }

  public sendRegister(status: statusCode): void {
    this.send('register', {
      status,
    });
  }

  public sendChangeNickname(status: statusCode): void {
    this.send('changeNickname', {
      status,
      ...this.schemesPack,
    })
  }

  public sendChangePassword(status: statusCode): void {
    this.send('changePassword', {
      status,
      ...this.schemesPack,
    })
  }

  public sendChangeUsername(status: statusCode): void {
    this.send('changeUsername', {
      status,
      ...this.schemesPack,
    })
  }

  public sendChangeEmail(status: statusCode): void {
    this.send('changeEmail', {
      status,
      ...this.schemesPack,
    })
  }

  public sendRestorePassword(status: statusCode): void {
    this.send('restorePassword', {
      status,
      ...this.schemesPack,
    });
  }

  public sendDeleteAccount(status: statusCode): void {
    this.send('deleteAccount', {
      status,
    })
  }

  public sendVerification(): void {
    this.send('verification');
  }

  public sendInformation(): void {
    this.send('information', {
      config: config,
    });
  }

  /**
   * Packs all the information from the database into objects in JSON format, to send to the client.
   */
  protected get schemesPack(): any {
    return {
      account: this.account?.toJSON(),
      profile: this.profile?.toJSON(),
      statistic: this.statistic?.toJSON(),
    };
  }

  public sendPing(): void {
    this.send('ping', {
      time: new Date().getTime() - App.pingStartTime,
    });
  }

  public sendPong(time: number): void {
    this.send('pong', {
      time,
    });
  }

  public sendMatchmakerPlayerCount(count: number): void {
    this.send('matchmakerPlayerCount', {
      count,
    });
  }

  // Fight stuff
  public sendFightJoin(status: statusCode, data: any = undefined): void {
    this.send('fightJoin', {
      status,
      data: JSON.stringify(data),
    });
  }

  public sendFightAction(action: number, playerId: number): void {
    this.send('fightAction', {
      action,
      playerId,
    });
  }

  public sendFightPower(power: number, playerId: number): void {
    this.send('fightPower', {
      power,
      playerId,
    });
  }

  public sendFightCharacter(characterId = this.fight.characterId, skinId = this.fight.characterSkinId) {
    this.send('fightCharacter', {
      characterId,
      skinId
    });
  }

  public sendFightSpecialAction(playerId: number): void {
    this.send('fightSpecialAction', {
      playerId,
    });
  }

  public sendFightSpecialActionCharge(charge: number, playerId: number): void {
    this.send('fightSpecialActionCharge', {
      charge,
      playerId,
    });
  }

  public sendFightInitiative(initiative: target): void {
    this.send('fightInitiative', {
      initiative
    });
  }

  public sendFightExtraAction(attackIndex: number, seed: number): void {
    this.send('fightExtraAction', {
      attackIndex,
      seed
    });
  }

  public sendFightStartBattle(seed: number): void {
    this.send('battleStart', {
      seed
    });
  }

  public sendDataToClient(index: string, data: any): void {
    this.send(index, data);
  }

  public sendFightSoul(x: number, y: number, angle: number, ability: number, playerId: number): void {
    this.send('fightSoul', {
      x,
      y,
      angle,
      ability,
      playerId,
    });
  }

  public sendFightHp(hp: number, playerId: number): void {
    this.send('fightHp', {
      hp,
      playerId,
    });
  }

  public sendFightMana(mana: number, playerId: number): void {
    this.send('fightMana', {
      mana,
      playerId,
    });
  }

  public sendFightStamina(stamina: number, playerId: number): void {
    this.send('fightStamina', {
      stamina,
      playerId,
    });
  }

  public sendFightDodge(): void {
    this.send('fightDodge');
  }

  public sendFightStun(playerId: number): void {
    this.send('fightStun', {
      playerId,
    });
  }

  public sendFightCollider(playerId: number): void {
    this.send('fightColliderSoul', {
      playerId,
    });
  }

  public sendFightDisconnect(playerId: number): void {
    this.send('fightDisconnect', {
      playerId,
    });
  }

  public sendFightFinished(rating: number, winner: boolean): void {
    this.send('fightFinished', {
      rating,
      winner,
    });
  }

  public sendFightResetAction(): void {
    this.send('fightResetAction')
  }

  public sendFightResetPower(): void {
    this.send('fightResetPower')
  }

  public sendFightBattleEnd(damage: number): void {
    this.send('battleEnd', {
      damage
    });
  }

  public sendFightClientRemove(): void {
    this.send('fightClientRemove');
  }

  public sendFightClientAdd(): void {
    this.send('fightClientAdd');
  }

  public sendGetAccountsInfo(status: statusCode, profiles: object) {
    this.send('getAccountsInfo', {
      status,
      profiles,
    });
  }
}
