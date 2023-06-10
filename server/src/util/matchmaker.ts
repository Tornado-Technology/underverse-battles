import Client, { state } from '../concepts/client.js';
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

  public static async addRating(winner: Client, looser: Client): Promise<number> {
    if (!winner?.hasProfile || !looser?.hasProfile) {
      let message = 'Add rating failed, reason: ';

      if (!winner?.hasProfile && !looser?.hasProfile) {
        message += `both clients ${winner?.username}(Winner) and ${looser?.username}(Loser), don't have profile!`
      } else {
        const client = !winner?.hasProfile ? winner : looser;
        const role = !winner?.hasProfile ? 'Winner' : 'Loser';
        message += `client ${client?.username}(${role}), don't have profile!`
      }

      Logger.warn(message);
      return 0;
    }

    const winnerRating = winner.profile.rating;
    const looserRating = looser.profile.rating;
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

    difference = looser.rank.clamp(looserRating, difference);
    await winner?.addRating(difference);
    await looser?.removeRating(difference);
    return difference;
  }

  protected static createMatch(client1: Client, client2: Client) {
    Fight.create(client1, client2);
  }

  protected static ratingCalculation(val1: number, val2: number): number {
    return Math.ceil((Math.abs(val1 - val2)) / 5) + 1;
  }
}
