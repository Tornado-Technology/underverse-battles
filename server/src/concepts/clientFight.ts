import Client from './client.js';
import Fight from '../game/fight.js';
import { characterInfoGetById}  from "../content/character/chracterInfoList";
import CharacterInfo from "../data/characterInfo";

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

  protected characterId: number;
  protected characterSkinId: number;
  protected characterInfo: CharacterInfo;

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

  public init(id: string, index: number): void {
    this.id = id;
    this.index = index;
    this.hp = this.hpMax;
    this.mana = this.manaMax / 2;
    this.stamina = this.staminaMax;
    this.action = -1;
    this.power = 0;
    this.client.profile.fight.id = id;
    this.client.profile.fight.index = index;
  }

  public setCharacter(characterId: number, skinId: number): void {
    this.characterId = characterId;
    this.characterSkinId = skinId;
    this.characterInfo = characterInfoGetById(characterId);

    if (this.characterInfo.skins) {
      if (this.characterInfo.skins[skinId] !== undefined) {
        this.characterInfo = this.characterInfo.skins[skinId];
      }
    }

    if (this.characterInfo !== undefined) {
      this.hpMax = this.characterInfo.hpMax;
      this.manaMax = this.characterInfo.manaMax;
      this.staminaMax = this.characterInfo.staminaMax;
    }
  }

  public get info() {
    return {
      id: this.id,
      characterId: this.characterId,
      skinId: this.characterSkinId,
      name: this.client?.account.username,
      rating: this.client?.profile.rating,
      type: this.client?.account.type,
      badgeId: this.client?.account?.badgeId,
    };
  }

  public get hasInstance(): boolean {
    return Boolean(this.instance);
  }
}
