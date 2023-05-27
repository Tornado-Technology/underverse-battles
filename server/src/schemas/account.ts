import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { hashPassword, verifyPassword } from '../util/encrypting.js';
import { statusCode } from '../status.js';

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
const passwordRegex = /^(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&#]{6,}$/;
const usernameRegex = /^[a-zA-Z_][a-zA-Z0-9_.-]{1,29}$/;
const usernameBlacklist = [
  usernameDefault,
];

export const validatePassword = (password: string): number => {
  return passwordRegex.test(password) ? statusCode.success : statusCode.databasePasswordWrong;
}

export const validateUsername = async (username: string): Promise<number> => {
  if (!usernameRegex.test(username) && usernameBlacklist.find((item) => item === username)?.length > 0) {
    return statusCode.databaseUsernameWrong;
  }

  return await Account.findOne({ username }) ? statusCode.databaseUsernameBusy : statusCode.success;
}

export const validateEmail = async (email: string): Promise<number> => {
  return await Account.findOne({ email }) ? statusCode.databaseEmailBusy : statusCode.success;
}

export const infoValidate = async (username: string, password: string, email: string): Promise<number> => {
  const usernameValidation = await validateUsername(username);
  if (usernameValidation !== statusCode.success) {
    return usernameValidation;
  }

  const passwordValidation = validatePassword(password);
  if (passwordValidation !== statusCode.success) {
    return passwordValidation;
  }

  const emailValidation = await validateEmail(email);
  if (emailValidation !== statusCode.success) {
    return emailValidation;
  }

  return statusCode.success;
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


export const Account: Model<IAccount> = model(accountModelName, schema);
