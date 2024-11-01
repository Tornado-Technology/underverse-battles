import App from '../../app.js';
import { statusCode } from '../../status.js';
import Logger from '../../util/logging.js';
import { Handler, handlerFlags, IHandlerContext } from '../handler.js';
import { addHandler } from '../handleStuff.js';

addHandler(new Handler('friendListRemove', async function(this: IHandlerContext) {
  const accountId = this.data.accountId;
  if (!accountId)
    throw statusCode.error;

  const account = await this.getAccountById(accountId);
  if (!account)
    throw statusCode.databaseAccountNotExists;
  const profile = await this.getProfileByAccountId(accountId);
  if (!profile)
    throw statusCode.databaseProfileNotExists;

  const index = this.profile.friends.indexOf(profile._id);
  if (index === -1)
    throw statusCode.databaseFriendNotExists;

  this.profile.friends.splice(index, 1);
  profile.friends.splice(profile.friends.indexOf(this.profile._id), 1);
  
  await this.client.update();

  this.send({
    code: statusCode.success,
    accountId: accountId
  });

  const client = App.clients.find(client => client.profile?._id.toString() === profile._id.toString());
  if (!client) {
    Logger.info(`Client with profile \"${profile._id}\" not online`);
    return;
  }

  await client.update();

  client.send('friendListRemove', {
    code: statusCode.success,
    accountId: this.account._id
  });

}).setFlags(handlerFlags.requireLogging));