import Client, { state } from '../concepts/client/client.js';
import Matchmaker, { matchType } from './matchmaker.js';
import Logger from './logging.js';

export default class MatchmakerPrivate {
  private static matches = new Map<string, Array<Client>>();
  private static keys = new Map<Client, string>();

  public static addWaiting(client: Client, key: string): void {
    const array = this.matches.get(key);
    if (!array) {
      this.matches.set(key, [client]);
      this.keys.set(client, key);
      return;
    }
    array.push(client);
    this.keys.set(client, key);
  }

  public static tryAddWaiting(client: Client, key: string): boolean {
    if (client.fight.hasInstance) {
      Logger.info(`The client ${client.username} is trying to start a battle during other battle`);
      return false;
    }

    const array = this.matches.get(key) ?? [];
    if (array.some(c => c.account.username === client.account.username)) {
      Logger.info(`The client is trying to start a battle with himself: ${client.username}`);
      return false;
    }

    this.addWaiting(client, key);
    client.setState(state.waitFight);
    return true;
  }

  public static removeWaiting(client: Client): void {
    const array = this.matches.get(this.keys.get(client));
    if (!array) {
      return;
    }
    if (!array.some(element => element === client)) {
      return;
    }
    array.splice(array.indexOf(client), 1);
    this.keys.delete(client);
  }

  public static async makeMatch(key: string): Promise<void> {
    const type = matchType.common_1vs1;
    const array = this.matches.get(key);

    if (array.length < 2) {
      return;
    }

    Matchmaker.makeMatch(type, array[0], array[1]);

    this.matches.delete(key);
    this.keys.delete(array[0]);
    this.keys.delete(array[1]);
  }
}
