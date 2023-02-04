import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { hashPassword, verifyPassword } from '../util/encrypting.js';
import App from '../app.js';

// @ts-ignore
const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

type AccountType = 'developer' | 'admin' | 'betaTester' | 'user';
type AccountPromise = Promise<IAccount>;

export interface IAccount extends Document {
  username: string,
  nickname: string,
  password: string,
  email: string,
  data: Date,
  type: AccountType,
}

export interface IAccountModel extends Model<IAccount> {
  login: (username: string, password: string) => AccountPromise;
  register: (username: string, password: string, email: string) => AccountPromise;
  infoValidate: (username: string, password: string, email: string) => Promise<number>;
}

const schema = new Schema({
  username: { type: String, unique: true },
  email: { type: String, unique: true },
  nickname: { type: String },
  password: { type: String },
  date: { type: Date, default: Date.now },
  type: { type: String, default: 'user' },
  badgeId: { type: Number, default: 0 },
}, {
  collation: 'accounts',
});

export const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&#]{6,}$/;
export const usernameRegex = /^[a-zA-Z_][a-zA-Z0-9_.-]{1,29}$/;

schema.statics.infoValidate = async function infoValidate(username: string, password: string, email: string): Promise<number> {
  if (!usernameRegex.test(username)) {
    return App.status.usernameNotMatchRules;
  }

  if (!passwordRegex.test(password)) {
    return App.status.passwordNotMatchRules;
  }

  if (await App.database.collection('accounts').findOne({ username })) {
    return App.status.usernameBusy;
  }

  if (await App.database.collection('accounts').findOne({ email })) {
    return App.status.emailBusy;
  }

  return App.status.success;
}

schema.statics.register = function accountRegister(username: string, password: string, email: string): AccountPromise {
  return new Promise<IAccount>(async (resolve, reject) => {
    const account = new Account({
      username,
      nickname: username,
      password: await hashPassword(password),
      email,
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

schema.statics.login = function accountLogin(username: string, password: string): Promise<string | IAccount> {
  return new Promise(async (resolve, reject) => {
    Account.findOne({username: username}, async (error: Error, account: IAccount) => {
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
    })
  })
}

export const Account: IAccountModel = model('Account', schema);
