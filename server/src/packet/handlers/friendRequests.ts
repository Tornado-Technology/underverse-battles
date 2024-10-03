import App from '../../app.js';
import { RequestType, FriendRequest, friendRequestAccept, requestGetData, removeRequest, requestCreate, requestExists } from '../../database/schemas/friendRequest.js';
import { statusCode } from '../../status.js';
import Logger from '../../util/logging.js';
import { addHandler } from '../handleStuff.js';
import { Handler, IHandlerContext, handlerFlags } from '../handler.js';

addHandler(new Handler('friendRequest', async function(this: IHandlerContext) {
  const profileSender = this.profile;
  const profileReceiver = await this.getProfileByAccountFinder(this.data.accountFinder);

  if (profileSender._id.toString() === profileReceiver._id.toString()) {
    throw statusCode.canNotAddYourselfAsFriend;
  }

  if (profileSender.friends.includes(profileReceiver._id))
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

  const client = App.clients.find(client => client.profile?._id.toString() === profileReceiver._id.toString());
  if (!client) {
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

  const client = App.clients.find(client => client.profile?._id.toString() === requestData.senderId.toString());
  if (!client) {
    return;
  }

  this.send({
    code: statusCode.success,
    type: requestData.type,
    accountId: requestData.senderId
  });
  
  client.send('friendRequestAccept', {
    code: statusCode.success,
    type: requestData.type,
    accountId: requestData.receiverId
  });
  
}).setFlags(handlerFlags.requireLogging).setFallbackCode(statusCode.databaseError));

addHandler(new Handler('friendRequestReject', async function(this: IHandlerContext) {
  await removeRequest(this.data.requestId);
  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging).setFallbackCode(statusCode.databaseError));
