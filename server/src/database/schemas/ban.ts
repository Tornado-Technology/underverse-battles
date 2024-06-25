import { ObjectId, Model } from 'mongoose';
import { createRequire } from 'module';
import { profileModelName } from './profile.js';
import { statusCode } from '../../status.js';
import Logger from '../../util/logging.js';
import { Account } from './account.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export const banCollection = 'bans';
export const banModelName = 'Ban';

export interface IBan {
  executor: string,
  target: ObjectId,
  reason: string,
  date: Date,
  ip: string,
  hardAddress: string,
}

const schema = new Schema({
  executor: { type: String, default: "by console" },
  target: { type: Schema.Types.ObjectId, unique: true, ref: profileModelName },
  reason: { type: String, default: null },
  date: { type: Date, default: Date.now },
  ip: { type: String, default: null },
  hardAddress: { type: String, default: null },
}, {
  collection: banCollection,
});

export const banUsername = async (username: string, executor: string, reason: string, ip: string | null = null, hardAddress: string | null = null): Promise<statusCode> => {
  const account = await Account.findOne({ username }).clone();
  if (!account)
    return statusCode.databaseAccountNotExists;

  return await ban(account._id, executor, reason, ip, hardAddress);
};

export const ban = async (target: string, executor: string, reason: string, ip: string | null = null, hardAddress: string | null = null): Promise<statusCode> => {
  if (await Ban.findOne({ target }))
      throw statusCode.databaseBanExists;

  const ban = new Ban({
    target,
    executor,
    reason,
    ip,
    hardAddress,
  });

  try {
    await ban.save();
  } catch(error) {
    Logger.error(error.message);
    throw statusCode.error;
  }

  return statusCode.success;
};

export const Ban: Model<IBan> = model(banModelName, schema);
