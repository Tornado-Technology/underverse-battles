import { Model, Document, ObjectId } from 'mongoose';
import { createRequire } from 'module';
import { IProfile, Profile, profileModelName } from './profile.js';

// @ts-ignore
const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export interface IFriendRequest extends Document {
  senderId: ObjectId;
  receiverId: ObjectId;
}

const schema = new Schema({
  senderId: { type: Schema.Types.ObjectId, ref: profileModelName },
  receiverId: { type: Schema.Types.ObjectId, ref: profileModelName },
}, {
  collection: 'friendRequests',
});

export const findIncoming = async function(profileId: string): Promise<IProfile[]> {
  return await (await FriendRequest.find({ receiverId: profileId }).populate<{ senderId: IProfile }>('senderId')).map((req) => req.senderId);
}

export const findOutgoing = async function(profileId: string): Promise<IProfile[]> {
  return (await FriendRequest.find({ senderId: profileId }).populate<{ receiverId: IProfile }>('receiverId')).map((req) => req.receiverId);
}

export const findRequestId = async function(senderId: string, receiverId: string): Promise<IFriendRequest> {
  return (await FriendRequest.exists({ senderId, receiverId }))._id;
}

export const requestExists = async function(senderId: string, receiverId: string): Promise<boolean> {
  return !!await FriendRequest.exists({ senderId, receiverId });
}

export const accept = async function(_id: ObjectId | string): Promise<void> {
  const
    req: IFriendRequest = await FriendRequest.findById(_id);
  await Profile.findByIdAndUpdate(req.senderId, { $push: { friends: req.senderId } });
  await Profile.findByIdAndUpdate(req.receiverId, { $push: { friends: req.receiverId  } });
  await req.deleteOne();
}

export const reject = async function(requestId: ObjectId | string): Promise<void> {
  await FriendRequest.findByIdAndDelete(requestId);
}

export const cancel = async function(requestId: ObjectId | string): Promise<void> {
  await FriendRequest.findByIdAndDelete(requestId);
}

export const FriendRequest: Model<IFriendRequest> = new model('FriendRequest', schema);
