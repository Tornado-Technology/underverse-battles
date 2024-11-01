import Client from '../concepts/client/client.js';
import { Account, IAccount, IAccountFinder, getAccountByFinder } from '../database/schemas/account.js';
import { IProfile, Profile } from '../database/schemas/profile.js';
import { statusCode } from '../status.js';
import Logger from '../util/logging.js';
import App from '../app.js';

type handlerCallback = () => Promise<void>;

export enum handlerFlags {
  nothing = 0,
  requireLogging = 1 << 0,
}

export interface IHandlerContext {
  handler: Handler,
  client: Client,
  data: any,
  account: IAccount | undefined,
  profile: IProfile | undefined,
  send(data: any): void,
  sendCode(code: statusCode): void,
  sendTo(client: Client, data: any): void,
  getAccountById(id: string): Promise<IAccount>,
  getAccountByFinder(finder: IAccountFinder): Promise<IAccount>,
  getAccountByProfileId(id: string): Promise<IAccount>,
  getAccountByUsername(username: string): Promise<IAccount>,
  getProfileById(id: string): Promise<IProfile>,
  getProfileByAccountId(id: string): Promise<IProfile>,
  getProfileByUsername(username: string): Promise<IProfile>,
  getProfileByAccountFinder(finder: IAccountFinder): Promise<IProfile>,
  getClientByAccountFinder(finder: IAccountFinder): Promise<Client | undefined>,
  __stashAccounts: Map<string, IAccount>,
  __stashProfiles: Map<string, IProfile>,
}

export class Handler {
  public readonly index: string;

  private readonly callback: handlerCallback;
  private flags: number;
  private fallbackCode: statusCode | undefined = undefined;

  constructor(index: string, callback: handlerCallback, flags: number = handlerFlags.nothing) {
    this.index = index;
    this.callback = callback;
    this.flags = flags;
  } 

  public setFlags(flags: number = handlerFlags.nothing): this {
    this.flags = flags;
    return this;
  }

  
  public setFallbackCode(status: statusCode): this {
    this.fallbackCode = status;
    return this;
  }

  public async invoke(client: Client, data: any) : Promise<void> {
    if (this.hasFlag(handlerFlags.requireLogging) && !client.isLogin) {
      this.sendCode(client, statusCode.databaseAccountNotExists);
      return;
    }

    const callback = this.callback.bind(new HandlerContext(this, client, data));

    try {
      await callback();
    } catch (error) {
      this.handleError(client, error);
    }
  }

  public send(client: Client, data: any, code: statusCode = statusCode.success) {
    client.send(this.index, {
      code,
      ...data,
    });
  }

  public sendCode(client: Client, code: statusCode) {
    client.send(this.index, {
      code,
    });
  }

  private handleError(client: Client, error: any) {
    if (this.fallbackCode) {
      this.sendCode(client, this.fallbackCode);
      return;
    }

    if (typeof(error) === 'number') {
      this.sendCode(client, error);
      Logger.error(error.toString());
      return;
    }

    this.send(client, {
      error,
    }, statusCode.error);
  }

  private hasFlag(flag: handlerFlags): boolean {
    return (this.flags & flag) === flag;
  }
}

export class HandlerContext implements IHandlerContext {
  public readonly handler: Handler;
  public readonly client: Client;
  public readonly data: any;
  public readonly account: IAccount | undefined;
  public readonly profile: IProfile | undefined;
  public readonly __stashAccounts = new Map<string, IAccount>();;
  public readonly __stashProfiles =  new Map<string, IProfile>();

  constructor(handler: Handler, client: Client, data: any) {
    this.handler = handler;
    this.client = client;
    this.data = data;

    this.account = client.account;
    this.profile = client.profile;
  }

  public send(data: any) {
    this.handler.send(this.client, data);
  }

  public sendCode(code: statusCode) {
    this.handler.sendCode(this.client, code);
  }

  public sendTo(client: Client, data: any) {
    this.handler.send(client, data);
  }

  public async getAccountById(id: string): Promise<IAccount> {
    if (this.__stashAccounts.has(id))
      return this.__stashAccounts.get(id);

    const account = await Account.findById(id);
    if (!account) throw statusCode.databaseAccountNotExists;

    this.__stashAccounts.set(id, account);
    return account;
  }

  public async getAccountByFinder(finder: IAccountFinder): Promise<IAccount> {
    const account = await getAccountByFinder(finder);
    if (!account) throw statusCode.databaseAccountNotExists;

    return account;
  }

  public async getAccountByProfileId(id: string): Promise<IAccount> {
    const profile = await this.getProfileById(id);
    if (!profile) throw statusCode.databaseAccountNotExists;

    return await this.getAccountById(profile.accountId.toString());
  }

  public async getAccountByUsername(username: string): Promise<IAccount> {
    const account = await Account.findOne({ username: username });
    if (!account) throw statusCode.databaseAccountNotExists;

    return account;
  }

  public async getProfileById(id: string): Promise<IProfile> {
    if (this.__stashProfiles.has(id))
      return this.__stashProfiles.get(id);

    const profile = await Profile.findById(id);
    if (!profile) throw statusCode.databaseProfileNotExists

    this.__stashProfiles.set(id, profile);
    return profile;
  }

  public async getProfileByAccountId(id: string): Promise<IProfile> {
    const profile = await Profile.findOne({ accountId: id });
    if (!profile) throw statusCode.databaseProfileNotExists;
    
    return profile;
  }

  public async getProfileByUsername(username: string): Promise<IProfile> {
    const account = await this.getAccountByUsername(username);
    return await this.getProfileByAccountId(account._id);
  }

  public async getProfileByAccountFinder(finder: IAccountFinder): Promise<IProfile> {
    const account = await this.getAccountByFinder(finder);
    return await this.getProfileByAccountId(account._id);
  }

  public async getClientByAccountFinder(finder: IAccountFinder): Promise<Client | undefined> {
    const account = await this.getAccountByFinder(finder);
    const client = App.clients.find(client => client.account._id.toString() === account._id.toString());
    if (!client) throw statusCode.error;

    return client;
  }
}
