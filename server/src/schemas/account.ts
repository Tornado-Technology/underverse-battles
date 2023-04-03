import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { hashPassword, verifyPassword } from '../util/encrypting.js';
import App from '../app.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

type AccountType = 'developer' | 'admin' | 'betaTester' | 'user';

export interface IAccount extends Document {
  username: string,
  nickname: string,
  password: string,
  email: string,
  data: Date,
  type: AccountType,
  badgeId: number,
}

const schema = new Schema({
  username: { type: String, unique: true },
  email: { type: String, unique: true },
  nickname: { type: String },
  password: { type: String },
  date: { type: Date, default: Date.now },
  type: { type: String, default: 'user' },
  badge: { type: Number, default: null },
}, {
  collection: 'accounts',
});

export const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&#]{6,}$/;
export const usernameRegex = /^[a-zA-Z_][a-zA-Z0-9_.-]{1,29}$/;

export const infoValidate = async (username: string, password: string, email: string): Promise<number> => {
  if (!usernameRegex.test(username)) {
    return App.status.usernameNotMatchRules;
  }

  if (!passwordRegex.test(password)) {
    return App.status.passwordNotMatchRules;
  }

  if (await Account.findOne({ username })) {
    return App.status.usernameBusy;
  }

  if (await Account.findOne({ email })) {
    return App.status.emailBusy;
  }

  return App.status.success;
}

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
        reject(App.status.accountExists);
        return;
      }

      reject(App.status.unknownError);
    });
  });
}

export const login = (username: string, password: string): Promise<IAccount> => new Promise(async (resolve, reject) => {
  await Account.findOne({ username: username }, async (error: Error, account: IAccount) => {
    if (!account) {
      reject(App.status.accountNotFound);
      return;
    }

    if (error) {
      reject(App.status.unknownError);
      return;
    }

    if (await verifyPassword(password, account.password)) {
      resolve(account);
      return;
    }

    reject(App.status.incorrectPassword);
  }).clone();
});


export const Account: Model<IAccount> = model('Account', schema);
