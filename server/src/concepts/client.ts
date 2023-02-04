import { ObjectId } from 'mongoose';
import { v4 as uuid4 } from 'uuid';
import { Socket } from 'net';
import { generateVerificationCode } from '../util/encrypting.js';
import { freshProfile, IProfile, Profile } from '../schemas/profile.js';
import { FriendRequest } from '../schemas/friendRequest.js';
import { IAccount } from '../schemas/account.js';
import ClientFight from './clientFight.js';
import SendStuff from '../packet/sendStuff.js';
import Logger from '../util/logging.js';
import App from '../app.js';
import {clearTimeout} from "timers";

export type SocketType = 'tcp' | 'udp' | 'ws';

export default class Client extends SendStuff {
  public readonly verificationCodeClearingTime: number = 50000;

  public ping: number;
  public verificationCode: string;
  public verificationCodeTimeout: NodeJS.Timeout;
  public verificationCodeCallback: Function;

  constructor(socket: Socket, type: SocketType, uuid: string) {
    super(socket, type, uuid);
    this.fight = new ClientFight(this);
  }

  static create(socket: Socket, type: SocketType) {
    const client = new Client(socket, type, uuid4());
    App.clients.push(client);
    return client;
  }

  static async remove(client: Client): Promise<void> {
    await client.onDisconnect(App.status.socketClosed);
    App.clients.splice(App.clients.indexOf(client), 1);
  }

  public startVerification(callback: Function): void {
    this.verificationCodeCallback = callback;
    this.generateVerificationCode();
    this.sendVerification();
  }

  public generateVerificationCode(): void {
    this.verificationCode = generateVerificationCode();
    this.verificationCodeTimeout = setTimeout(this.clearVerificationCode, this.verificationCodeClearingTime);
  }

  public clearVerificationCode(): void {
    if (this.verificationCodeTimeout) {
      clearTimeout(this.verificationCodeTimeout);
    }
    this.verificationCodeTimeout = null;
    this.verificationCode = null;
  }

  public destroy(): void {

  }

  public async onDisconnect(status: number): Promise<void> {
    Logger.info(`Client disconnected: ${status}`);
    await this.save();
    this.fight.leave();
  }

  public logout(): void {
    this.account = null;
    this.profile = null;
    this.statistic = null;
    this.sendLogout(App.status.success);
  }

  public onLogin(): void {
    // Restore...
  }

  public async tryLogin(account: IAccount): Promise<void> {
    this.account = account;
    await Profile.findOne({
      accountId: account._id
    }).then((profile) => {
      if (profile) {
        this.profile = profile;
        this.sendLogin(App.status.success);
        return;
      }
      this.sendLogin(App.status.profileNotFound);
      throw new Error(`Couldn't find a profile with these credentials`);
    });
  }

  public async register(account: IAccount): Promise<void> {
    this.account = account;
    this.profile = await freshProfile(account);
    this.onLogin();
    this.sendRegister(App.status.success);
  }

  public async save(): Promise<void> {
    await this.account?.save();
    await this.profile?.save();
    await this.statistic?.save();
  }

  public async deleteAccount(): Promise<void> {
    // App.database.collection('statistics').deleteOne({  });
    await App.database.collection('profiles').deleteOne({ _id: this.profile._id });
    await App.database.collection('accounts').deleteOne({ _id: this.account._id });
    this.logout();
  }

  public async getFriends(): Promise<IProfile[]> {
    if (!this.isLogin) {
      return [];
    }
    // @ts-ignore
    return (await Profile.findById(this.profile._id).populate<{ friends: IProfile[] }>('friends')).friends;
  }

  public getFriendIds(): ObjectId[] {
    if (!this.isLogin) {
      return [];
    }
    return this.profile.friends;
  }

  async getIncomingFriendRequests(): Promise<IProfile[]> {
    if (!this.isLogin) {
      return [];
    }
    return await FriendRequest.findIncoming(this.profile._id);
  }

  async getOutgoingFriendRequests(): Promise<IProfile[]> {
    if (!this.isLogin) {
      return [];
    }
    return await FriendRequest.findOutgoing(this.profile._id);
  }

  public addRating(rating: number): void {
    if (this.hasProfile) {
      this.profile.rating += Math.abs(rating);
      this.update();
    }
  }

  public removeRating(rating: number): void {
    if (this.hasProfile) {
      this.profile.rating = Math.max(0, this.profile.rating - Math.abs(rating));
      this.update();
    }
  }

  public addGold(gold: number): void {
    if (this.hasProfile) {
      this.profile.gold += Math.abs(gold);
      this.update();
    }
  }

  public removeGold(gold: number): void {
    if (this.hasProfile) {
      this.profile.gold += Math.max(0, this.profile.gold - Math.abs(gold));
      this.update();
    }
  }

  public hasGold(gold: number): boolean {
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