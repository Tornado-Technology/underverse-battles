import { ObjectId } from 'mongoose';
import { v4 as uuid4 } from 'uuid';
import { Socket } from 'net';
import { generateVerificationCode, hashPassword } from '../../util/encrypting.js';
import { freshProfile, IProfile, Profile } from '../../database/schemas/profile.js';
import { findIncoming, findOutgoing } from '../../database/schemas/friendRequest.js';
import { Account, IAccount, usernameDefault } from '../../database/schemas/account.js';
import { getRank } from '../../content/rankList.js';
import { statusCode } from '../../status.js';
import ClientFight from './clientFight.js';
import SendStuff from '../../packet/sendStuff.js';
import Logger from '../../util/logging.js';
import App from '../../app.js';
import Rank from '../../data/rank.js';
import Matchmaker from '../../util/matchmaker.js';

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
  public readonly verificationCodeClearingTime: number = 50_000;

  public ping: number;
  public verificationCode: string;
  public verified: boolean;
  public verifying: boolean;
  public verificationCodeTimeout: NodeJS.Timeout;
  public verificationCodeCallback: Function;

  public removedRating: number;
  public resultingRating: number = 0;

  protected _state: state;

  protected stateNames = ['undefined', 'in menu', 'waiting fight', 'in fight', 'waiting open world', 'in open world'];

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
    await client.onDisconnect(statusCode.serverSocketClosed);
    App.clients.splice(App.clients.indexOf(client), 1);
  }

  public verify() {
    this.verified = true;
    Logger.info(`Client verified, UUID: ${this.uuid}.`);
  }

  public async startVerification(callback: Function): Promise<void> {
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
    Matchmaker.removeWaiting(this);
    await this.fight.leave();
    await this.save();
  }

  public logout(): void {
    this.account = undefined;
    this.profile = undefined;
    this.sendLogout(statusCode.success);
  }

  public async onLogin(): Promise<void> {
    await this.fight.tryRestore();
  }

  public async tryLogin(account: IAccount): Promise<void> {
    this.account = account;
    await Profile.findOne({
      accountId: account._id
    }).then((profile) => {
      if (profile) {
        this.profile = profile;
        this.sendLogin(statusCode.success);
        return;
      }
      this.sendLogin(statusCode.databaseProfileNotExists);
      throw new Error(`Couldn't find a profile with these credentials`);
    });
  }

  public async register(account: IAccount): Promise<void> {
    this.account = account;
    this.profile = await freshProfile(account);
    this.sendRegister(statusCode.success);
  }

  public async save(): Promise<void> {
    if (!this.isLogin) return;
    await this.account?.save();
    await this.profile?.save();
  }

  public async deleteAccount(): Promise<void> {
    if (!this.isLogin) return;
    await Profile.deleteOne({ _id: this.profile._id });
    await Account.deleteOne({ _id: this.account._id });
    this.logout();
  }

  public async getFriends(): Promise<IProfile[]> {
    return this.isLogin ? (await Profile.findById(this.profile._id).populate<{ friends: IProfile[] }>('friends')).friends : [];
  }

  public getFriendIds(): ObjectId[] {
    return this.isLogin ? this.profile.friends : [];
  }

  async getIncomingFriendRequests(): Promise<IProfile[]> {
    return this.isLogin ? await findIncoming(this.profile._id) : [];
  }

  async getOutgoingFriendRequests(): Promise<IProfile[]> {
    return this.isLogin ? await findOutgoing(this.profile._id) : [];
  }

  public async addRating(rating: number): Promise<void> {
    if (this.hasProfile) {
      this.profile.rating += Math.abs(rating);
      this.update();
      await this.save();
    }
  }

  public async removeRating(rating: number): Promise<void> {
    this.removedRating = 0;
    if (this.hasProfile) {
      this.profile.rating -= rating;
      this.removedRating = rating;
      if (this.profile.rating <= 0) {
        this.removedRating = this.profile.rating + rating;
        this.profile.rating = 0;
      }
      this.update();
      await this.save();
    }
  }

  public setResultingRating(rating: number): void {
    this.resultingRating = rating;
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
    return this.hasAccount && this.hasProfile;
  }

  public get hasAccount(): boolean {
    return Boolean(this.account);
  }

  public get hasProfile(): boolean {
    return Boolean(this.profile);
  }

  public setState(newState: state): void {
    this._state = newState;
    Logger.debug(`Client ${this.nickname} set new state "${this.stateNames[newState]}"`);
  }

  public get state(): state {
    return this._state;
  }

  public get rank(): Rank | undefined {
    return this.isLogin ? getRank(this.rating) : undefined;
  }

  public get rating(): number {
    return this.isLogin ? this.profile.rating : 0;
  }

  public get badge(): number | null {
    return this.isLogin ? this.profile.badge : null;
  }

  public get username(): string {
    return this.isLogin ? this.account.username : usernameDefault;
  }

  public get nickname(): string {
    return this.isLogin ? this.account.nickname : this._nickname;
  }

  public get friendInfo() {
    return {
      username: this.username,
      online: this.isLogin ? this.profile.online : null,
      lastOnline: this.isLogin ? this.profile.lastOnline : null,
    }
  }
}