import { v4 as generateUUID } from 'uuid';
import Client from '../concepts/client.js';
import Fight from '../fight/fight.js';
import App from '../app.js';

export default class Matchmaker {
  public static makeMatch(client1: Client, client2: Client): void {
    if (client1.fight.hasInstance || client2.fight.hasInstance || client1 === client2) {
      return;
    }
    this.createMatch(client1, client2);
  }

  public static findFight(id: string): (Fight | undefined) {
    return App.fights.find((fight) => fight.id === id);
  }

  protected static createMatch(client1: Client, client2: Client) {
    const id = generateUUID();
    const fight = new Fight(id, client1, client2);

    fight.clients.forEach((client, index) => {
      client.fight.init(id, index);
      // client.sendFightJoin('success', fight.getOtherClient(client).fight.getInfo(), 'created');
    });

    //fight.trace(`Created, Players: ${client1?.account.username} vs ${client2?.account.username}`);

    //// Set choose action state for fight
    //fight.setState(Fight.states.choose);
    //fight.setInitiative(fight.initiative);

    App.fights.push(fight);
  }
}
