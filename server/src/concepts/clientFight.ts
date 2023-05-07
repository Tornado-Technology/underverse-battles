import Client from './client.js';
import Fight, {actionType, target} from '../game/fight/fight.js';
import {characterInfoGetById} from '../content/chracterInfoList.js';
import CharacterInfo from '../data/characterInfo.js';
import ClientFightInfo from './fight/clientFightInfo.js';
import SoulData from '../game/fight/soulData.js';

export default class ClientFight {
  public readonly client: Client | null;

  // Fight info
  public id: string;
  public index: number;
  public hp: number;
  public hpMax: number;
  public mana: number;
  public manaMax: number;
  public stamina: number;
  public staminaMax: number;
  public action: actionType;
  public power: number;
  public specialActionCharge: number;

  public characterId: number;
  public characterSkinId: number;
  public characterInfo: CharacterInfo;

  public soul: SoulData;

  private _instance: Fight | null;

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

  public init(fight: Fight, index: number): void {
    this._instance = fight;
    this.id = fight.id;
    this.index = index;
    this.hp = this.hpMax;
    this.mana = this.manaMax / 2;
    this.stamina = this.staminaMax;
    this.action = actionType.empty;
    this.power = 0;
    this.specialActionCharge = 0;

    const fightInfo = this.client.profile.fight;
    fightInfo.id = this.id;
    fightInfo.index = this.index;
    fightInfo.hp = this.hp;
    fightInfo.mana = this.mana;
    fightInfo.stamina = this.stamina;
    fightInfo.characterId = this.characterId;
    fightInfo.specialActionCharge = this.specialActionCharge;
    this.client.save();
  }

  public unit(): void {
    this.id = null;
    this.index = null;
    this.hp = null;
    this.hpMax = null;
    this.mana = null;
    this.manaMax = null;
    this.stamina = null;
    this.staminaMax = null;
    this.action = null;
    this.power = null;
    this.specialActionCharge = null;
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

  public setAction(action: actionType): void {
    this.action = action;
    this.client.sendFightAction(action, target.self);
  }

  public setPower(power: number): void {
    this.power = power;
    this.client.sendFightPower(power, target.self);
  }

  public setSpecialActionCharge(charge: number): void {
    charge = Math.clamp(charge, 0, 100);
    this.specialActionCharge = charge;
    this.client.sendFightSpecialActionCharge(charge, target.self);
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

  public get instance(): Fight {
    return this._instance;
  }

  public get hasInstance(): boolean {
    return Boolean(this._instance);
  }

  public get info(): ClientFightInfo {
    return new ClientFightInfo(this);
  }

  public get isChosen(): boolean {
    return this.action !== actionType.empty;
  }

  public get isChooses(): boolean {
    return this.action === actionType.empty;
  }
}
