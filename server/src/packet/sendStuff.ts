import { Socket } from 'net';
import { socketType } from '../concepts/client.js';
import { IAccount } from '../schemas/account.js';
import { IProfile } from '../schemas/profile.js';
import { IStatistic } from '../schemas/statistic.js';
import { target } from '../game/fight.js';
import ClientFight from '../concepts/clientFight.js';
import Packet from './packet.js';
import App from '../app.js';

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

  constructor(socket: Socket, type: socketType, uuid: string) {
    this.socket = socket;
    this.type = type;
    this.uuid = uuid;
  }

  protected send(index: string, data: any = {}): void {
    data.index = index;
    this.socket.write(Packet.build(data));
  }

  public sendConnection(code = 0): void {
    this.send('connection', {
      code
    });
  }

  // MongoDB packets
  protected sendSchemes(): void {
    this.send('schemes', {
      ...this.schemesPack,
    });
  }

  public sendLogin(status: number): void {
    this.send('login',{
      status,
      ...this.schemesPack,
    })
  }

  public sendLogout(status: number): void {
    this.send('logout', {
      status,
    });
  }

  public sendRegister(status: number): void {
    this.send('register', {
      status,
    });
  }

  public sendChangeNickname(status: number): void {
    this.send('changeNickname', {
      status,
      ...this.schemesPack,
    })
  }

  public sendChangePassword(status: number): void {
    this.send('changePassword', {
      status,
      ...this.schemesPack,
    })
  }

  public sendChangeUsername(status: number): void {
    this.send('changeUsername', {
      status,
      ...this.schemesPack,
    })
  }

  public sendDeleteAccount(status: number): void {
    this.send('deleteAccount', {
      status,
    })
  }

  public sendVerification(): void {
    this.send('verification');
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

  // Fight stuff
  public sendFightJoin(status: number, data: any): void {
    this.send('fightJoin', {
      status,
      data: JSON.stringify(data),
    });
  }

  public sendFightEnd(rating: number, winner: boolean): void {
    this.send('fightEnd', {
      rating,
      winner,
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


  public sendFightStartBattle(seed: number): void {
    this.send('battleStart', {
      seed,
    });
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

  public sendFightBattleEnd(): void {
    this.send('battleEnd');
  }
}
