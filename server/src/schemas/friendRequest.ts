import { Model, Document, ObjectId } from 'mongoose';
import { createRequire } from 'module';
import { IProfile, Profile } from './profile.js';
import App from '../app.js';

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
  sender: { type: Schema.Types.ObjectId, ref: 'Profile' },
  receiver: { type: Schema.Types.ObjectId, ref: 'Profile' },
}, {
  collection: 'FriendRequests',
});

schema.statics.findIncoming = async function(profile_id: string): Promise<IProfile[]> {
 return [];
  // return await (await FriendRequest.find({ receiver: profile_id }).populate<{ sender: IProfile }>('sender')).map(req => req.sender);
}

schema.statics.findOutgoing = async function(profile_id: string): Promise<IProfile[]> {
  return [];
  // return (await FriendRequest.find({ sender: profile_id }).populate<{ receiver: IProfile }>('receiver')).map(req => req.receiver);
}

schema.statics.findRequestId = async function(sender: string, receiver: string): Promise<IFriendRequest> {
  return  new Promise((resolve) => {});
  //return (await FriendRequest.exists({ sender, receiver }))._id;
}

schema.statics.requestExists = async function(sender: string, receiver: string): Promise<boolean> {
  return !!await FriendRequest.exists({ sender, receiver });
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
