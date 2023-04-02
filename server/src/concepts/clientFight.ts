import Client from './client.js';
import Fight, { target } from '../game/fight.js';
import { characterInfoGetById }  from '../content/chracterInfoList.js';
import CharacterInfo from '../data/characterInfo.js';

class SoulData {
  public x: number;
  public y: number;
  public angle: number;
  public ability: number;

  constructor(x: number = 0, y: number = 0, angle: number = 0, ability: number = 0) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.ability = ability;
  }
}

export default class ClientFight {
  private readonly client: Client = null;
  public instance: Fight;

  // Fight info
  public id: string;
  public index: number;
  public hp: number;
  public hpMax: number;
  public mana: number;
  public manaMax: number;
  public stamina: number;
  public staminaMax: number;
  public action: number;
  public power: number;
  public specialActionCharge: number;

  public characterId: number;
  public characterSkinId: number;
  public characterInfo: CharacterInfo;

  public soul: SoulData;

  constructor(client: Client) {
    this.client = client;
    this.soul = new SoulData();
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
    this.specialActionCharge = 0;
    this.client.profile.fight.id = id;
    this.client.profile.fight.index = index;
  }

  public unit(): void {

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

  public setAction(action: number): void {
    this.action = action;
    this.client.sendFightAction(action, target.self);
  }

  public setPower(power: number): void {
    this.power = power;
    this.client.sendFightPower(power, target.self);
  }

  public setHp(hp: number): void {
    this.hp = hp;
  }

  public addHp(hp: number): void {
    this.setHp(Math.min(this.hpMax, this.hp + Math.abs(hp)));
  }

  public removeHp(hp: number): void {
    this.setHp(Math.max(0, this.hp - Math.abs(hp)));
  }

  public setMana(mana: number): void {
    this.mana = mana;
  }

  public addMana(mana: number): void {
    this.setMana(Math.min(this.manaMax, this.mana + Math.abs(mana)));
  }

  public removeMana(mana: number): void {
    this.setMana(Math.max(0, this.mana - Math.abs(mana)));
  }

  public setStamina(stamina: number): void {
    this.stamina = stamina;
  }

  public addStamina(stamina: number): void {
    this.setStamina(Math.min(this.staminaMax, this.stamina + Math.abs(stamina)));
  }

  public removeStamina(stamina: number): void {
    this.setStamina(Math.max(0, this.stamina - Math.abs(stamina)));
  }

  public setSoulData(x: number, y: number, angle: number, ability: number): void {
    this.soul.x = x;
    this.soul.y = y;
    this.soul.angle = angle;
    this.soul.ability = ability;
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

  public get isChosen(): boolean {
    return this.action !== -1;
  }

  public get isChooses(): boolean {
    return this.action === -1;
  }
}
