import { ObjectId } from 'mongoose';
import { v4 as uuid4 } from 'uuid';
import { Socket } from 'net';
import {generateVerificationCode, hashPassword} from '../util/encrypting.js';
import { freshProfile, IProfile, Profile } from '../schemas/profile.js';
import { FriendRequest } from '../schemas/friendRequest.js';
import { IAccount } from '../schemas/account.js';
import ClientFight from './clientFight.js';
import SendStuff from '../packet/sendStuff.js';
import Logger from '../util/logging.js';
import App from '../app.js';
import {clearTimeout} from "timers";
import Rank from '../data/rank.js';
import { getRank } from '../content/rankList.js';

export enum socketType {
  tcp = 'tcp',
  udp = 'udp',
  ws = 'ws',
}

export enum state {
  undefined,
  inMenu,
  waitFight,
  inFight,
  waitWorld,
  inWorld,
}

export default class Client extends SendStuff {
  public readonly verificationCodeClearingTime: number = 50000;

  public ping: number;
  public verificationCode: string;
  public verified: boolean;
  public verifying: boolean;
  public verificationCodeTimeout: NodeJS.Timeout;
  public verificationCodeCallback: Function;

  protected _state: state;

  constructor(socket: Socket, type: socketType, uuid: string) {
    super(socket, type, uuid);
    this.fight = new ClientFight(this);
    this.setState(state.inMenu);
  }

  static create(socket: Socket, type: socketType) {
    const client = new Client(socket, type, uuid4());
    App.clients.push(client);
    return client;
  }

  static async remove(client: Client): Promise<void> {
    await client.onDisconnect(App.status.socketClosed);
    App.clients.splice(App.clients.indexOf(client), 1);
  }

  verify() {
    this.verified = true;
    Logger.info(`Client verified, UUID: ${this.uuid}.`);
  }

  public startVerification(callback: Function): void {
    this.verificationCodeCallback = callback;
    this.generateVerificationCode();
    this.sendVerification();
    Logger.info(this.verificationCode);
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

  public destroy(forced: boolean = false, timeout = 5_000): void {
    if (forced) {
      this.socket.destroy();
      return;
    }

    setTimeout(() => {
      this.socket.destroy();
    }, timeout);
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

  public async setUsername(username: string): Promise<void> {
    if (!this.isLogin) {
      return;
    }

    this.account.username = username;
    await this.save();
  }

  public async setNickname(nickname: string): Promise<void> {
    if (!this.isLogin) {
      return;
    }

    this.account.nickname = nickname;
    await this.save();
  }

  public async setPassword(password: string): Promise<void> {
    if (!this.isLogin) {
      return;
    }

    this.account.password = await hashPassword(password);
    await this.save();
  }

  public async setEmail(email: string): Promise<void> {
    if (!this.isLogin) {
      return;
    }
    this.account.email = email;
    await this.save();
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

  public setState(state: state) {
    this._state = state;
    Logger.info(`Client set new state "${state}"`);
  }

  public get state(): state {
    return this._state;
  }

  public get rank(): Rank {
    return this.isLogin ? getRank(this.profile.rating) : undefined;
  }
}