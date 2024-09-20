import { statusCode } from '../../status.js';
import { Handler, handlerFlags, IHandlerContext } from '../handler.js';
import { addHandler } from '../handleStuff.js';
import { state } from '../../concepts/client/client.js';
import Matchmaker, { matchType } from '../../util/matchmaker.js';

addHandler(new Handler('friendFightJoin', async function(this: IHandlerContext) {
  const finder = this.data.targetFinder;
  if (!finder)
    throw statusCode.databaseProfileNotExists;

  const client = await this.getClientByAccountFinder(finder);
  if (!client)
    throw statusCode.error; // not in online

  if (client.state !== state.inMenu || this.client.state !== state.inMenu)
    throw statusCode.error;

  Matchmaker.makeMatch(matchType.common_1vs1, client, this.client);
  
  client.setState(state.inFight);
  this.client.setState(state.inFight);
  
  this.sendCode(statusCode.success);
}).setFlags(handlerFlags.requireLogging));