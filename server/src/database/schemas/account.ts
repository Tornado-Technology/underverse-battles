import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { hashPassword, verifyPassword } from '../../util/encrypting.js';
import { statusCode } from '../../status.js';
import { Profile } from './profile.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export const accountCollection = 'accounts';
export const accountModelName = 'Account';

export enum accountType {
  user = 0,
  betaTester = 1,
  administrator = 2,
  developer = 3,
}

export interface IAccount extends Document {
  username: string,
  nickname: string,
  password: string,
  email: string,
  date: Date,
  type: accountType,
}

export interface IAccountFinder {
  id: string | undefined,
  username: string | undefined,
  profileId: string | undefined
}

const schema = new Schema({
  username: { type: String, unique: true },
  email: { type: String, unique: true },
  nickname: { type: String },
  password: { type: String },
  date: { type: Date, default: Date.now },
  type: { type: Number, default: accountType.user },
}, {
  collection: accountCollection,
});

export const usernameDefault = 'User';

export const register = (username: string, password: string, email: string): Promise<IAccount> => {
  return new Promise(async (resolve, reject) => {
    const account = new Account({
      username: username,
      nickname: username,
      password: await hashPassword(password),
      email: email,
    });

    await account.save((error) => {
      if (!error) {
        resolve(account);
        return;
      }

      if (error['code'] === 11000) {
        reject(statusCode.databaseAccountExists);
        return;
      }

      reject(statusCode.error);
    });
  });
}

export const login = (username: string, password: string): Promise<IAccount> => new Promise(async (resolve, reject) => {
  await Account.findOne({ username: username }, async (error: Error, account: IAccount) => {
    if (!account) {
      reject(statusCode.databaseAccountNotExists);
      return;
    }

    if (error) {
      reject(statusCode.error);
      return;
    }

    if (!await verifyPassword(password, account.password)) {
      reject(statusCode.databasePasswordWrong);
      return;
    }

    resolve(account);
  }).clone();
});

export const getAccountByFinder = async (finder: IAccountFinder): Promise<IAccount> => {
  if (finder.id)
    return await Account.findOne({ _id: finder.id });

  if (finder.username) 
    return await Account.findOne({ username: finder.username });

  if (finder.profileId) {
    const profile = await Profile.findOne({ _id: finder.profileId });
    return profile ? await Account.findOne({ _id: profile.accountId }) : undefined;
  }

  return undefined;
};

export const Account: Model<IAccount> = model(accountModelName, schema);
