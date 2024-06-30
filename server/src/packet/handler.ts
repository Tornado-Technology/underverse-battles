import Client from '../concepts/client/client.js';
import { Account, IAccount, IAccountFinder, getAccountByFinder } from '../database/schemas/account.js';
import { IProfile, Profile } from '../database/schemas/profile.js';
import { statusCode } from '../status.js';

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
  send: (data: any) => void,
  sendCode: (code: statusCode) => void,
  sendTo: (client: Client, data: any) => void,
  getAccountById: (id: string) => Promise<IAccount>,
  getAccountByFinder: (finder: IAccountFinder) => Promise<IAccount>,
  getAccountByProfileId: (id: string) => Promise<IAccount>,
  getProfileById: (id: string) => Promise<IProfile>,
  getProfileByAccountId: (id: string) => Promise<IProfile>,
  getProfileByAccountFinder: (finder: IAccountFinder) => Promise<IProfile>,
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

    this.callback.bind({
      handler: this,
      client,
      account: client.account,
      profile: client.profile,
      data,
      send: function(data: any) {
        this.handler.send(this.client, data);
      },
      sendCode: function(code: statusCode) {
        this.handler.sendCode(client, code);
      },
      sendTo: function(client: Client, data: any) {
        this.handler.send(client, data);
      },
      getAccountById: async function(id: string) {
        if (this.__stashAccounts.has(id))
          return this.__stashAccounts.get(id);

        const account = await Account.findById(id);
        if (!account) throw statusCode.databaseAccountNotExists;

        this.__stashAccounts.set(id, account);
        return account;
      },
      getAccountByFinder: async function(finder: IAccountFinder) {
        const account = await getAccountByFinder(finder);
        if (!account) throw statusCode.databaseAccountNotExists;

        return account;
      },
      getAccountByProfileId: async function(id: string) {
        const profile = await this.getProfileById(id);
        if (!profile) throw statusCode.databaseAccountNotExists;

        return await this.getProfile(profile.accountId);
      },
      getProfileById: async function(id: string) {
        if (this.__stashProfiles.has(id))
          return this.__stashProfiles.get(id);

        const profile = await Profile.findById(id);
        if (!profile) throw statusCode.databaseProfileNotExists

        this.__stashProfiles.set(id, profile);
        return profile;
      },
      getProfileByAccountId: async function(id: string) {
        const profile = await Profile.findOne({ accountId: id });
        if (!profile) throw statusCode.databaseProfileNotExists;
        
        return profile;
      },
      getProfileByAccountFinder: async function(finder: IAccountFinder) {
        const account = await this.getAccountByFinder(finder);
        return await this.getProfileByAccountId(account._id);
      },
      __stashAccounts: new Map<string, IAccount>(),
      __stashProfiles: new Map<string, IProfile>(),
    });

    try {
      await this.callback();
    } catch (error) {
      this.handleError(client, error);
    }
  }

  public send(client: Client, data: any, code: statusCode = statusCode.success) {
    client.send(this.index, {
      code,
      data,
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

// I HATE TS
/*
export class HandlerContext implements IHandlerContext {
  handler: Handler;
  client: Client;
  data: any;
  account: IAccount | undefined;
  profile: IProfile | undefined;
  __stashAccounts: Map<string, IAccount>;
  __stashProfiles: Map<string, IProfile>;

  constructor(handler: Handler, client: Client, data: any) {
    this.handler = handler;
    this.client = client;
    this.data = data;

    this.account = client.account;
    this.profile = client.profile;

    this.__stashAccounts = new Map<string, IAccount>();
    this.__stashProfiles = new Map<string, IProfile>();
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

    return await this.getProfile(profile.accountId);
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

  public async getProfileByAccountFinder(finder: IAccountFinder): Promise<IProfile> {
    const account = await this.getAccountByFinder(finder);
    return await this.getProfileByAccountId(account._id);
  }
}
*/
