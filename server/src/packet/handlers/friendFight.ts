import { statusCode } from '../../status.js';
import { Handler, handlerFlags, IHandlerContext } from '../handler.js';
import { addHandler } from '../handleStuff.js';
import { state } from '../../concepts/client/client.js';
import Matchmaker, { matchType } from '../../util/matchmaker.js';

addHandler(new Handler('friendFightRequest', async function(this: IHandlerContext) {
  const finder = this.data.targetFinder;
  if (!finder)
    throw statusCode.databaseProfileNotExists;

  const client = await this.getClientByAccountFinder(finder);

  if (client.state !== state.inMenu || this.client.state !== state.inMenu)
    throw statusCode.userInFightAlready;

  this.sendCode(statusCode.success);

  client.send('friendFightRequestInvite', {
    code: statusCode.success,
    username: this.client.account.username,
  });
}).setFlags(handlerFlags.requireLogging));

addHandler(new Handler('friendFightJoin', async function(this: IHandlerContext) {
  const finder = this.data.targetFinder;
  if (!finder)
    throw statusCode.databaseProfileNotExists;

  const client = await this.getClientByAccountFinder(finder);

  if (client.state !== state.inMenu || this.client.state !== state.inMenu)
    throw statusCode.userInFightAlready;

  Matchmaker.makeMatch(matchType.common_1vs1, client, this.client);
  
  client.setState(state.inFight);
  this.client.setState(state.inFight);
  
  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging));