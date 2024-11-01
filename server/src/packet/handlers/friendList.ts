import App from '../../app.js';
import { statusCode } from '../../status.js';
import { Handler, handlerFlags, IHandlerContext } from '../handler.js';
import { addHandler } from '../handleStuff.js';

addHandler(new Handler('friendListRemove', async function(this: IHandlerContext) {
  const profileId = this.data.profileId;
  if (!profileId)
    throw statusCode.error;

  const account = await this.getAccountByProfileId(profileId);
  if (!account)
    throw statusCode.databaseAccountNotExists;
  const profile = await this.getProfileByAccountId(account._id);
  if (!profile)
    throw statusCode.databaseProfileNotExists;

  const index = this.profile.friends.indexOf(profile._id);
  if (index === -1)
    throw statusCode.databaseFriendNotExists;

  this.profile.friends.splice(index, 1);
  profile.friends.splice(profile.friends.indexOf(this.profile._id), 1);
  
  this.client.update();
  await this.client.save();

  this.send({
    code: statusCode.success,
    accountId: account._id
  });

  const client = App.clients.find(client => client.profile?._id.toString() === profile._id.toString());
  if (!client) return;

  client.update();
  await client.save();

  client.send('friendListRemove', {
    code: statusCode.success,
    accountId: this.account._id
  });

}).setFlags(handlerFlags.requireLogging));