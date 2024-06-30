import App from '../../app.js';
import { FriendRequest, requestAccept, requestGetData, requestReject, requestCreate, requestExists } from '../../database/schemas/friendRequest.js';
import { statusCode } from '../../status.js';
import Logger from '../../util/logging.js';
import { addHandler } from '../handleStuff.js';
import { Handler, IHandlerContext, handlerFlags } from '../handler.js';

addHandler(new Handler('friendRequest', async function(this: IHandlerContext) {
  const profileSender = this.profile;
  const profileReceiver = await this.getProfileByAccountFinder(this.data.accountFinder);

  if (await requestExists(profileSender._id, profileReceiver._id))
    throw statusCode.databaseError; // TODO: Add custom code

  const request = await requestCreate(profileSender._id, profileReceiver._id);
  const data = await requestGetData(request._id);
  const client = App.clients.find(client => client.profile._id ?? undefined === profileReceiver._id);

  if (!client) return;
  
  client.send('friendRequestInvite', {
    code: statusCode.success,
    data,
  });
}).setFlags(handlerFlags.requireLogging));

addHandler(new Handler('friendRequestGetAll', async function(this: IHandlerContext) {
  const result = {};
  const requests = await FriendRequest.find({ senderId: this.profile._id });
  
  for (const request of requests) {
    try {
      request[request._id] = await requestGetData(request._id);
    } catch (error) {
      result[request._id] = undefined;
      Logger.debug(`friendRequestSend error: ${error}`);
    }
  }

  this.send({
    requests: result,
  });
}).setFlags(handlerFlags.requireLogging));

addHandler(new Handler('friendRequestAccept', async function(this: IHandlerContext) {
  await requestAccept(this.data.requestId);
  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging).setFallbackCode(statusCode.databaseError));

addHandler(new Handler('friendRequestReject', async function(this: IHandlerContext) {
  await requestReject(this.data.requestId);
  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging).setFallbackCode(statusCode.databaseError));
