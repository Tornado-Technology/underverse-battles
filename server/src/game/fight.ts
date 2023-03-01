import Client from '../concepts/client.js';
import Logger from '../util/logging.js';
import App from '../app.js';

export enum state {
  wait,
  choose,
  fight,
  battle,
  reset,
}

export enum target {
  self,
  opponent,
}

export default class Fight {
  protected _id: string;
  protected clients: Client[];
  protected state: state;
  protected initiative: number;
  protected timeout: NodeJS.Timeout;
  protected destroyTimeout: NodeJS.Timeout;

  constructor(client1: Client, client2: Client, id: string) {
    this._id = id;
    this.state = state.wait;
    this.clients = [client1, client2];
    this.initiative = Math.randomRange(0, 1);
    this.initializeClients();
  }

  public initializeClients(): void {
    this.clients.forEach((client, index) => {
      client.fight.init(this.id, index);
      client.sendFightJoin(App.status.success, this.getOtherClient(client).fight.info);
    });

    this.setState(state.choose);
    this.setInitiative(this.initiative);
  }

  public get id(): string {
    return this._id;
  }

  public static create(client1: Client, client2: Client): void {
    const fight = new Fight(client1, client2, String(Date.now()));
    App.fights.push(fight);
    Logger.info(`Fight "${fight.id}" created, ${client1?.account.username} vs ${client2?.account.username}`);
  }

  public static destroy(fight: Fight): void {
    App.fights.splice(App.fights.indexOf(fight), 1);
    Logger.info(`Fight "${fight.id}" destroyed`);
  }

  public destroy(): void {
    Fight.destroy(this);
  }

  protected setState(state): void {
    this.state = state;
    Logger.debug(`Fight[${this.id}] set new state "${state}"`);
  }

  protected setInitiative(initiative) {
    this.initiative = initiative;
    this.clients[0]?.sendFightInitiative(this.initiative);
    this.clients[1]?.sendFightInitiative(1 - this.initiative);
    Logger.debug(`Fight[${this.id}] set new initiative "${initiative}"`);
  }

  protected getOtherClient(client: Client): Client {
    return (client === this.clients[target.self]) ? this.clients[target.opponent] : this.clients[target.self];
  }
}