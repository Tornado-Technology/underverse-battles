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

  protected static createMatch(client1: Client, client2: Client) {
    Fight.create(client1, client2);
  }
}
