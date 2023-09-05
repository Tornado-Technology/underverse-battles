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
    if (!client?.hasProfile) {
      Logger.warn(`Remove rating failed, reason: client ${client?.username} don't have profile!`);
      return 0;
    }
    const rating = client?.resultingRating;
    await client?.addRating(rating * 2);
    return rating;
  }

  public static async removeRating(clients: Client[]): Promise<void> {
    clients.forEach((client, index) => {
      if (!client?.hasProfile) {
        Logger.warn(`Remove rating failed, reason: client ${client?.username} don't have profile!`);
        return;
      }

      const winnerRating = clients[1 - index].profile.rating;
      const looserRating = client.profile.rating;
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

      difference = client.rank.clamp(looserRating, difference);
      client?.setResultingRating(difference);
      client?.removeRating(difference);
    });
  }

  protected static createMatch(client1: Client, client2: Client) {
    Fight.create(client1, client2);
  }

  protected static ratingCalculation(val1: number, val2: number): number {
    return Math.ceil((Math.abs(val1 - val2)) / 5) + 1;
  }
}
