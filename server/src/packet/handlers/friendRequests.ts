import App from '../../app.js';
import { RequestType, FriendRequest, friendRequestAccept, requestGetData, removeRequest, requestCreate, requestExists } from '../../database/schemas/friendRequest.js';
import { statusCode } from '../../status.js';
import Logger from '../../util/logging.js';
import { addHandler } from '../handleStuff.js';
import { Handler, IHandlerContext, handlerFlags } from '../handler.js';

addHandler(new Handler('friendRequest', async function(this: IHandlerContext) {
  const profileSender = this.profile;
  const profileReceiver = await this.getProfileByUsername(this.data.username);

  if (this.data.type === RequestType.friend && profileSender._id.toString() === profileReceiver._id.toString()) {
    throw statusCode.canNotAddYourselfAsFriend;
  }

  if (this.data.type === RequestType.friend && profileSender.friends.includes(profileReceiver._id))
    throw statusCode.userIsFriendAlready;

  if (await requestExists(profileSender._id, profileReceiver._id) || await requestExists(profileReceiver._id, profileSender._id))
    throw statusCode.requestAlreadySent;

  const request = await requestCreate(profileSender._id, profileReceiver._id, this.data.type);
  const data = await requestGetData(request._id);

  if (this.data.type === RequestType.fight) {
    setTimeout(() => {
      removeRequest(request._id);
    }, 10_000);
  }

  this.sendCode(statusCode.success);

  const client = App.clients.find(client => client.profile._id.toString() === profileReceiver._id.toString());
  if (!client) {
    Logger.info(`Client with profile \"${profileReceiver._id}\" not online`);
    return;
  }
  
  client.send('friendRequestInvite', {
    code: statusCode.success,
    request: data,
  });
}).setFlags(handlerFlags.requireLogging));

addHandler(new Handler('friendRequestGetAll', async function(this: IHandlerContext) {
  const result = {};
  const requests = [];
  (await FriendRequest.find({ receiverId: this.profile._id })).forEach(element => {
    if (element.type === RequestType.friend) requests.push(element);
  });
  
  let data = undefined;
  for (const request of requests) {
    try {
      data = await requestGetData(request._id);
    } catch (error) {
      Logger.debug(`friendRequestGetAll error: ${error}`);
    }

    result[request._id.toString()] = data;
  }

  this.send({
    requests: result,
  });
}).setFlags(handlerFlags.requireLogging));

addHandler(new Handler('friendRequestAccept', async function(this: IHandlerContext) {
  const requestData = await requestGetData(this.data.requestId);

  if (requestData.type === RequestType.friend) {
    await friendRequestAccept(this.data.requestId);
  } else {
    await removeRequest(this.data.requestId);
  }

  this.client.update();
  this.profile.update();

  const client = App.clients.find(client => client.profile?._id.toString() === requestData.senderId.toString());
  if (!client) {
    Logger.info(`Client with profile \"${requestData.senderId}\" not online`);
    return;
  }

  client.update();
  client.profile.update();

  this.send({
    code: statusCode.success,
    request: requestData,
    accountId: requestData.senderId
  });
  
  client.send('friendRequestAccept', {
    code: statusCode.success,
    request: requestData,
    accountId: requestData.receiverId
  });
  
}).setFlags(handlerFlags.requireLogging).setFallbackCode(statusCode.databaseError));

addHandler(new Handler('friendRequestReject', async function(this: IHandlerContext) {
  await removeRequest(this.data.requestId);
  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging).setFallbackCode(statusCode.databaseError));
