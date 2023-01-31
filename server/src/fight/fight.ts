import Client from '../concepts/client.js';

export default class Fight {
  public readonly id: string;
  public clients: Client[];

  protected initiative: number = 0; // TODO: Make random
  protected disconnectedTimeout: NodeJS.Timeout;
  protected destroyTimeout: NodeJS.Timeout;

  constructor(id: string, client1: Client, client2: Client) {
    this.id = id;
    this.clients = [client1, client2];
  }
}