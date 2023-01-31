import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { hashPassword } from '../util/encrypting.js';
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

      reject(App.status.unknownAccountError);
    });
  });
}

export const Account: IAccountModel = model('Account', schema);
