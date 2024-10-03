import { statusCode } from '../../status.js';
import { Handler, handlerFlags, IHandlerContext } from '../handler.js';
import { addHandler } from '../handleStuff.js';

addHandler(new Handler('friendListRemove', async function(this: IHandlerContext) {
  const finder = this.data.targetFinder;
  if (!finder)
    throw statusCode.databaseProfileNotExists;

  const account = await this.getAccountByFinder(finder);
  const profile = await this.getProfileByAccountId(account._id);

  const index = this.profile.friends.indexOf(profile._id);
  if (index === -1)
    throw statusCode.databaseFriendNotExists;

  this.profile.friends.splice(index, 1);
  profile.friends.splice(profile.friends.indexOf(this.profile._id), 1);
  
  await this.profile.save();
  await profile.save();

  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging));