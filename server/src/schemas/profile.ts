import { Document, ObjectId, Model } from 'mongoose';
import { createRequire } from 'module';
import { IAccount } from './account.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export interface IProfile extends Document {
  accountId: string,
  online: boolean,
  lastOnline: Date,
  friends: ObjectId[],
  unlockingCharacters: number[],
  rating: number,
  gold: number,
  fight: {
    id: string,
    index: number,
    hp: number,
    mana: number,
    stamina: number,
    characterId: number,
    specialActionCharge: number,
  }
}

const schema = new Schema({
  accountId: { type: Schema.Types.ObjectId, ref: 'Account' },
  online: { type: Boolean, default: false },
  lastOnline: { type: Date, default: Date.now },
  friends: [{ type: Schema.Types.ObjectId, ref: 'Account' }],
  rating: { type: Number, default: 0 },
  gold: { type: Number, default: 0 },
  fight: {
    id: { type: String, default: '' },
    index: { type: Number, default: -1 },
    hp: { type: Number, default: -1 },
    mana: { type: Number, default: -1 },
    stamina: { type: Number, default: -1 },
    characterId: { type: Number, default: -1 },
    specialActionCharge: { type: Number, default: -1 },
  },
}, {
  collection: 'profiles',
});

export const Profile: Model<IProfile> = model('Profile', schema);

export const freshProfile = async (account: IAccount): Promise<IProfile> => {
  const profile = new Profile({
    accountId: account._id,
  })

  await profile.save();
  return profile;
};
