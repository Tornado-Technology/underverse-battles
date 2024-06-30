import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { hashPassword, verifyPassword } from '../../util/encrypting.js';
import { statusCode } from '../../status.js';
import { IProfile } from './profile.js';

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

export const find = async (finder): Promise<IProfile> => {
  let search;
  
  if (finder.id)
    search = { _id: finder.accountId };

  if (finder.username) 
    search = { username: finder.username };

  return await Account.findOne(search)
};

export const Account: Model<IAccount> = model(accountModelName, schema);
