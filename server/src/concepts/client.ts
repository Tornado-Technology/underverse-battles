import { Socket } from 'net';
import { v4 as uuid4 } from 'uuid';
import { IAccount } from '../schemas/account.js';
import { freshProfile, Profile } from "../schemas/profile.js";
import SendStuff from '../packet/sendStuff.js';
import App from '../app.js';
import ClientFight from './clientFight.js';
import Logger from '../util/logging.js';

export type SocketType = 'tcp' | 'udp' | 'ws';

export default class Client extends SendStuff {
  static create(socket: Socket, type: SocketType) {
    const client = new Client(socket, type, uuid4());
    App.clients.push(client);
    return client;
  }

  static async remove(client: Client): Promise<void> {
    await client.onDisconnect(App.status.socketClosed);
    App.clients.splice(App.clients.indexOf(client), 1);
  }

  public ping: number;

  constructor(socket: Socket, type: SocketType, uuid: string) {
    super(socket, type, uuid);
    this.fight = new ClientFight(this);
  }

  public destroy(): void {

  }

  public async onDisconnect(status: number): Promise<void> {
    Logger.info(`Client disconnected: ${status}`);
    await this.save();
    this.fight.leave();
  }

  public async login(account: IAccount): Promise<void> {
    this.account = account;

    await Profile.findOne({
      accountId: account._id
    }).then((profile) => {
      if (profile) {
        this.profile = profile;
        this.sendLogin(App.status.success);
        return;
      }
      Logger.error(`Couldn't find a profile with these credentials`);
      this.sendLogin(App.status.profileNotFound);
    });
  }

  public logout(): void {
    this.account = null;
    this.profile = null;
    this.statistic = null;
    this.friendRequest = null;
    this.sendLogout(App.status.success);
  }

  public onLogin(): void {
    // Restore...
  }

  public register(account: IAccount): void {
    this.account = account;
    this.profile = freshProfile(account);
    this.onLogin();
    this.sendRegister(App.status.success);
  }

  public async save(): Promise<void> {
    await this.account?.save();
    await this.profile?.save();
    await this.statistic?.save();
    await this.friendRequest?.save();
  }

  addRating(rating: number): void {
    if (this.hasProfile) {
      this.profile.rating += Math.abs(rating);
      this.update();
    }
  }

  removeRating(rating: number): void {
    if (this.hasProfile) {
      this.profile.rating = Math.max(0, this.profile.rating - Math.abs(rating));
      this.update();
    }
  }

  addGold(gold: number): void {
    if (this.hasProfile) {
      this.profile.gold += Math.abs(gold);
      this.update();
    }
  }

  removeGold(gold: number): void {
    if (this.hasProfile) {
      this.profile.gold += Math.max(0, this.profile.gold - Math.abs(gold));
      this.update();
    }
  }

  hasGold(gold: number): boolean {
    if (this.hasProfile) {
      return this.profile.gold >= gold;
    }
    return false;
  }

  public update(): void {
    this.sendSchemes();
  }

  public get ip(): string {
    return this.socket.remoteAddress;
  }

  public get port(): number {
    return this.socket.remotePort;
  }

  public get address(): string {
    return `${this.port}:${this.ip}`
  }

  public get isLogin(): boolean {
    return Boolean(this.account);
  }

  public get hasProfile(): boolean {
    return Boolean(this.profile);
  }
}