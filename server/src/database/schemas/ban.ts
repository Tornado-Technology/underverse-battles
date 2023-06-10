import { ObjectId, Model } from 'mongoose';
import { createRequire } from 'module';
import { profileModelName } from './profile.js';
import { statusCode } from '../../status.js';
import Client from '../../concepts/client/client.js';
import Logger from '../../util/logging.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export const banCollection = 'bans';
export const banModelName = 'Ban';

export interface IBan {
  executor: ObjectId,
  target: ObjectId,
  reason: string,
  date: Date,
  ip: string,
  hardAddress : string,
}

const schema = new Schema({
  executor: { type: Schema.Types.ObjectId, ref: profileModelName },
  target: { type: Schema.Types.ObjectId, ref: profileModelName },
  reason: { type: String, default: null },
  date: { type: Date, default: Date.now },
  ip: { type: String, default: null },
  hardAddress: { type: String, default: null },
}, {
  collection: banCollection,
});

export const ban = (target: Client, executor: Client, reason: string, ip = false, hardAddress = false): Promise<statusCode> => new Promise(async (resolve, reject) => {
  const ban = new Ban({
    target,
    executor,
    reason,
    ip: ip ? target.ip : null,
    hardAddress: hardAddress ? target.hardAddress : null,
  });

  await ban.save((error) => {
    if (error) {
      Logger.error(error.message);
      reject(statusCode.error);
      return;
    }

    resolve(statusCode.success);
  });
});

export const Ban: Model<IBan> = model(banModelName, schema);
