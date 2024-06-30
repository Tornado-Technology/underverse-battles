import { Model, Document, ObjectId } from 'mongoose';
import { createRequire } from 'module';
import { IProfile, Profile, profileModelName } from './profile.js';
import { Account } from './account.js';

// @ts-ignore
const require = createRequire(import.meta.url);
const mongoose = require('mongoose');
const { Schema, model } = mongoose;

export interface IFriendRequest extends Document {
  senderId: ObjectId;
  receiverId: ObjectId;
  date: Date,
}

const schema = new Schema({
  senderId: { type: Schema.Types.ObjectId, ref: profileModelName },
  receiverId: { type: Schema.Types.ObjectId, ref: profileModelName },
  date: { type: Date, default: Date.now },
}, {
  collection: 'friendRequests',
});

export interface  IFriendRequestActorData {
  username: string,
  profile: IProfile,
}

export interface IFriendRequestData extends IFriendRequest {
  sender: IFriendRequestActorData,
  receiver: IFriendRequestActorData,
}

const requestGetActorData = async (profileId: ObjectId): Promise<IFriendRequestActorData> => {
  const profile = await Profile.findById(profileId);
  const account = await Account.findById(profile.accountId);

  return {
    username: account.username,
    profile: profile,
  }
}

export const requestGetData = async (id: string): Promise<IFriendRequestData> => {
  const request = await FriendRequest.findById(id);

  return {
    ...request,
    sender: await requestGetActorData(request.senderId),
    receiver: await requestGetActorData(request.receiverId),
  } as IFriendRequestData;
}

export const requestCreate = async (senderId: string, receiverId: string): Promise<IFriendRequest> => {
  return await new FriendRequest(
    senderId,
    receiverId,
  ).save();
}

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
  return Boolean(await FriendRequest.exists({ senderId, receiverId }));
}

export const requestAccept = async function(_id: ObjectId | string): Promise<void> {
  const
    req: IFriendRequest = await FriendRequest.findById(_id);
  await Profile.findByIdAndUpdate(req.senderId, { $push: { friends: req.senderId } });
  await Profile.findByIdAndUpdate(req.receiverId, { $push: { friends: req.receiverId  } });
  await req.deleteOne();
}

export const requestReject = async function(requestId: ObjectId | string): Promise<void> {
  await FriendRequest.findByIdAndDelete(requestId);
}

export const cancel = async function(requestId: ObjectId | string): Promise<void> {
  await FriendRequest.findByIdAndDelete(requestId);
}

export const FriendRequest: Model<IFriendRequest> = new model('FriendRequest', schema);
