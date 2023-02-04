import Client from './client.js';
import Fight from '../fight/fight.js';

export default class ClientFight {
  private readonly client: Client = null;
  public instance: Fight;

  // Fight info
  protected id: string;
  protected index: number;
  protected hp: number;
  protected hpMax: number;
  protected mana: number;
  protected manaMax: number;
  protected stamina: number;
  protected staminaMax: number;
  protected action: number;
  protected power: number;


  constructor(client: Client) {
    this.client = client;
  }

  public leave(): void {
   //const fight = MatchMaker.findClientFight(this);
   //if (fight !== undefined) {
   //  trace(chalk.yellow(`${this.username} exit from fight.`));
   //  this.fight.save();
   //  fight.kickPlayer(this, this.profile?.id);
   //}
  }

  init(id: string, index: number): void {
    this.id = id;
    this.index = index;
    this.hp = this.hpMax;
    this.mana = this.manaMax / 2;
    this.stamina = this.staminaMax;
    this.action = -1;
    this.power = 0;

    this.client.profile.fight.id = id;
    this.client.profile.fight.index = index;
    //this.client.setState(Client.states.inFight);
  }

  public get hasInstance(): boolean {
    return Boolean(this.instance);
  }
}
