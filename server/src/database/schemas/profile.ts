import { Document, ObjectId, Model } from 'mongoose';
import { createRequire } from 'module';
import { accountModelName, IAccount } from './account.js';
import CharacterInfo from '../../data/characterInfo.js';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export const profileCollection = 'profiles';
export const profileModelName = 'Profile';

export interface IProfile extends Document {
  accountId: ObjectId,
  online: boolean,
  lastOnline: Date,
  friends: ObjectId[],
  unlockingCharacters: {
    characterId: Number,
    skinId: Number
  }[],
  rating: number,
  gold: number,
  badge: number | null,
  fight: {
    id: string | null,
    index: number | null,
    characterInfo: CharacterInfo | null,
    hp: number | null,
    mana: number | null,
    stamina: number | null,
    specialActionCharge: number | null,
  }
}

const schema = new Schema({
  accountId: { type: Schema.Types.ObjectId, ref: accountModelName },
  online: { type: Boolean, default: false },
  lastOnline: { type: Date, default: Date.now },
  friends: [{ type: Schema.Types.ObjectId, ref: accountModelName }],
  unlockingCharacters: [{
    characterId: { type: Number, default: null },
    skinId: { type: Number, default: null }
  }],
  rating: { type: Number, default: 0 },
  gold: { type: Number, default: 0 },
  badge: { type: Number, default: null },
  fight: {
    id: { type: String, default: null },
    index: { type: Number, default: null },
    characterInfo: { type: CharacterInfo, default: null },
    hp: { type: Number, default: null },
    mana: { type: Number, default: null },
    stamina: { type: Number, default: null },
    specialActionCharge: { type: Number, default: null },
  },
}, {
  collection: profileCollection,
});

export const Profile: Model<IProfile> = model(profileModelName, schema);

export const freshProfile = async (account: IAccount): Promise<IProfile> => {
  const profile = new Profile({
    accountId: account._id,
  })

  await profile.save();
  return profile;
};
