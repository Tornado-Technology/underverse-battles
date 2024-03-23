import Client, { state } from '../concepts/client/client.js';
import App from '../app.js';
import Fight from '../game/fight/fight.js';
import Logger from './logging.js';

export enum matchType {
  common_1vs1,
	rating_1vs1,
	tournament_1vs1,
	common_2vs2,
	rating_2vs2,
	tournament_2vs2
}

export default class Matchmaker {
  private static matches = new Map<matchType, Array<Client>>();
  private static types = new Map<Client, matchType>();

  public static addWaiting(client: Client, type: matchType): void {
    const array = this.matches.get(type);
    if (!array) {
      this.matches.set(type, [client]);
      this.types.set(client, type);
      return;
    }
    array.push(client);
    this.types.set(client, type);
  }

  public static tryAddWaiting(client: Client, type: matchType): boolean {
    if (client.fight.hasInstance) {
      Logger.info(`The client ${client.username} is trying to start a battle during other battle`);
      return false;
    }

    const array = this.matches.get(type) ?? [];
    if (array.includes(client)) {
      Logger.info(`The client is trying to start a battle with himself: ${client.username}`);
      return false;
    }

    this.addWaiting(client, type);
    return true;
  }

  public static removeWaiting(client: Client): void {
    const array = this.matches.get(this.types.get(client));
    if (!array) {
      return;
    }
    if (!array.some(element => element === client)) {
      return;
    }
    array.splice(array.indexOf(client), 1);
    this.types.delete(client);
  }

  public static makeMatch(client1: Client, client2: Client): void {
    if (!client1.account || !client2.account) {
      Logger.warn(`Some client is trying to start a fight without account!`);
      return;
    }
    if (!client1.profile && !client2.profile) {
      Logger.warn(`Clients ${client1?.username} and ${client2?.username} is trying to start a fight without profile!`);
      return;
    }
    if (!client1.profile) {
      Logger.warn(`Client ${client1?.username} is trying to start a fight without profile!`);
      return;
    }
    if (!client2.profile) {
      Logger.warn(`Client ${client2?.username} is trying to start a fight without profile!`);
      return;
    }

    this.createMatch(client1, client2);
  }

  public static findFight(id: string): Fight {
    return App.fights.find((fight) => fight.id === id);
  }

  public static findClientsWithState(state: state): Client[] {
    return App.clients.filter((client) => client.state === state);
  }

  public static getTypeClients(type: matchType): Client[] {
    return this.matches.get(type) ?? [];
  }

  public static async addRating(client: Client): Promise<number> {
    if (!client) {
      Logger.warn(`Add rating failed, reason: client ${client?.username} not found!`);
      return 0;
    }
    
    const rating = client?.resultingRating;
    await client?.addRating(client?.removedRating + rating);
    return rating;
  }

  public static async removeRating(clients: Client[]): Promise<void> {
    for (let index = 0; index < clients.length; index++) {
      if (!clients[index]) {
        Logger.warn(`Remove rating failed, reason: client ${clients[index]?.username} not found!`);
        return;
      }
      if (!clients[index]?.hasProfile) {
        Logger.warn(`Remove rating failed, reason: client ${clients[index]?.username} don't have profile!`);
        return;
      }

      const winnerRating = clients[1 - index].profile.rating;
      const looserRating = clients[index].profile.rating;
      let difference = 0;

      if (winnerRating < looserRating) {
        difference = this.ratingCalculation(winnerRating, looserRating);
      }

      if (winnerRating > looserRating) {
        difference = 1;
      }

      if (winnerRating === looserRating) {
        difference = 2;
      }

      difference = clients[index].rank.clamp(looserRating, difference);
      clients[1 - index].setResultingRating(difference);
      await clients[index].removeRating(difference);
    }
  }

  public static async returnRating(client: Client): Promise<number> {
    if (!client) {
      Logger.warn(`Add rating failed, reason: client ${client?.username} not found!`);
      return 0;
    }
    
    await client?.addRating(client?.removedRating);
    return 0;
  }

  protected static createMatch(client1: Client, client2: Client) {
    Fight.create(client1, client2);
  }

  protected static ratingCalculation(val1: number, val2: number): number {
    return Math.ceil((Math.abs(val1 - val2)) / 5) + 1;
  }
}
