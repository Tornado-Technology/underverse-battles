import { Socket } from 'net';
import { SocketType } from '../concepts/client.js';
import { IAccount } from '../schemas/account.js';
import { IProfile } from '../schemas/profile.js';
import { IStatistic } from '../schemas/statistic.js';
import ClientFight from '../concepts/clientFight.js';
import Packet from './packet.js';
import App from '../app.js';

export default class SendStuff {
  public readonly socket: Socket;
  public readonly type: SocketType;
  public readonly uuid: string;

  // MongoDB schemes
  public account: IAccount;
  public profile: IProfile;
  public statistic: IStatistic;

  // Client components
  public fight: ClientFight = null;
  public halfpack: (Buffer | null) = null;

  constructor(socket: Socket, type: SocketType, uuid: string) {
    this.socket = socket;
    this.type = type;
    this.uuid = uuid;
  }

  protected send(index: string, data: any = {}): void {
    data.index = index;
    this.socket.write(Packet.build(data));
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
}