import Client, { state } from '../concepts/client/client.js';
import App from '../app.js';
import Fight from '../game/fight/fight.js';
import Logger from './logging.js';

export default class Matchmaker {
  public static makeMatch(client1: Client, client2: Client): void {
    this.createMatch(client1, client2);
  }

  public static findFight(id: string): Fight {
    return App.fights.find((fight) => fight.id === id);
  }

  public static findClientsWithState(state: state): Client[] {
    return App.clients.filter((client) => client.state === state);
  }

  public static async addRating(client: Client): Promise<number> {
    if (!client) {
      Logger.warn(`Remove rating failed, reason: client ${client?.username} not found!`);
      return 0;
    }
    const rating = client?.resultingRating;
    await client?.addRating(client?.removedRating + rating);
    return rating;
  }

  public static async removeRating(clients: Client[]): Promise<void> {
    for (let index = 0; index < clients.length; index++) {
      if (!clients[index]?.hasProfile) {
        Logger.warn(`Remove rating failed, reason: client ${clients[index]?.username} don't have profile!`);
        return;
      }
      if (!clients[index]) {
        Logger.warn(`Remove rating failed, reason: client ${clients[index]?.username} not found!`);
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
      clients[index].setResultingRating(difference);
      await clients[index].removeRating(difference);
    }
  }

  protected static createMatch(client1: Client, client2: Client) {
    Fight.create(client1, client2);
  }

  protected static ratingCalculation(val1: number, val2: number): number {
    return Math.ceil((Math.abs(val1 - val2)) / 5) + 1;
  }
}
