import { Model, Document } from 'mongoose';
import { createRequire } from 'module';
import { v4 as uuid4 } from 'uuid';

const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export const collection = 'token';
export const modelName = 'Token';

export enum tokenAccess {
	default = 0,
	administrator = 1,
}

export interface IToken extends Document {
	token: string,
	date: Date,
	access: tokenAccess,
}

const schema = new Schema({
  token: { type: String, unique: true },
  date: { type: Date, default: Date.now },
  access: { type: Number, default: tokenAccess.default },
}, {
  collection,
});

export const Token: Model<IToken> = model(modelName, schema);

export const create = async (access: tokenAccess = tokenAccess.default): Promise<IToken> => {
  const token = uuid4();
  const instance = new Token({
    token,
    access,
  });

  return await instance.save();
};
