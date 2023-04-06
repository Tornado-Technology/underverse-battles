import { Model, Document, ObjectId } from 'mongoose';
import { createRequire } from 'module';
import { IProfile, Profile } from './profile.js';

// @ts-ignore
const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export interface IFriendRequest extends Document {
  senderId: ObjectId;
  receiverId: ObjectId;
}

export interface IFriendRequestModel extends Model<IFriendRequest> {
  findIncoming(profileId: string): Promise<IProfile[]>;
  findOutgoing(profileId: string): Promise<IProfile[]>;
  findRequestId(senderId: string, receiverId: string): Promise<ObjectId>;
  requestExists(senderId: string, receiverId: string): Promise<boolean>;
  accept(requestId: ObjectId | string): Promise<void>;
  reject(requestId: ObjectId | string): Promise<void>;
  cancel(requestId: ObjectId | string): Promise<void>;
}

const schema = new Schema({
  senderId: { type: Schema.Types.ObjectId, ref: 'Profile' },
  receiverId: { type: Schema.Types.ObjectId, ref: 'Profile' },
}, {
  collection: 'friendRequests',
});

schema.statics.findIncoming = async function(profileId: string): Promise<IProfile[]> {
  return await (await FriendRequest.find({ receiverId: profileId }).populate<{ senderId: IProfile }>('senderId')).map(req => req.senderId);
}

schema.statics.findOutgoing = async function(profileId: string): Promise<IProfile[]> {
  return (await FriendRequest.find({ senderId: profileId }).populate<{ receiverId: IProfile }>('receiverId')).map(req => req.receiverId);
}

schema.statics.findRequestId = async function(senderId: string, receiverId: string): Promise<IFriendRequest> {
  return (await FriendRequest.exists({ senderId, receiverId }))._id;
}

schema.statics.requestExists = async function(senderId: string, receiverId: string): Promise<boolean> {
  return !!await FriendRequest.exists({ senderId, receiverId });
}

schema.statics.accept = async function(_id: ObjectId | string): Promise<void> {
  let req:IFriendRequest = await FriendRequest.findById(_id);
  await Profile.findByIdAndUpdate(req.senderId, { $push: { friends: req.senderId } });
  await Profile.findByIdAndUpdate(req.receiverId, { $push: { friends: req.receiverId  } });
  await req.deleteOne();
}

schema.statics.reject = async function(requestId: ObjectId | string): Promise<void> {
  await FriendRequest.findByIdAndDelete(requestId);
}

schema.statics.cancel = async function(requestId: ObjectId | string): Promise<void> {
  await FriendRequest.findByIdAndDelete(requestId);
}

export const FriendRequest: IFriendRequestModel = new model('FriendRequest', schema);
