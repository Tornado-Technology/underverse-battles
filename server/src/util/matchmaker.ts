import Client, { state } from '../concepts/client.js';
import App from '../app.js';
import Fight from '../game/fight.js';

export default class Matchmaker {
  public static makeMatch(client1: Client, client2: Client): void {
    if (client1.fight.hasInstance || client2.fight.hasInstance || client1 === client2) {
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


  public static addRating(winner: Client, looser: Client): void {
    const winnerRating = winner.profile.rating;
    const looserRating = looser.profile.rating;
    let difference = 0;
  }

  protected static createMatch(client1: Client, client2: Client) {
    Fight.create(client1, client2);
  }

  protected static ratingCalculation(val1: number, val2: number): number {
    return Math.ceil((Math.abs(val1 - val2)) / 5) + 1;
  }
}
