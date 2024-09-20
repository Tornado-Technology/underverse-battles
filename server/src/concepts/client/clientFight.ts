import Client from './client.js';
import Fight, { actionType, state, target } from '../../game/fight/fight.js';
import { characterInfoGetById } from '../../content/chracterInfoList.js';
import CharacterInfo from '../../data/characterInfo.js';
import ClientFightInfo from './fight/clientFightInfo.js';
import SoulData from '../../game/fight/soulData.js';
import Logger from '../../util/logging.js';
import Matchmaker from '../../util/matchmaker.js';
import { statusCode } from '../../status.js';

const defaultCharacterId = 0;

export default class ClientFight {
  public readonly client: Client;

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
  public removed: boolean;
  public responceTimeout: NodeJS.Timeout;

  private _instance: Fight;

  constructor(client: Client) {
    this.client = client;
    this.soul = new SoulData();
  }

  public init(fight: Fight, index: number) {
    this._instance = fight;

    this.id = fight.id;
    this.index = index;
    this.hp = this.hpMax;
    this.mana = this.manaMax / 2;
    this.stamina = this.staminaMax;
    this.action = actionType.empty;
    this.power = 0;
    this.specialActionCharge = 0;
    this.removed = false;
  }

  public unit(): void {
    this._instance = null;

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

    this.stopResponceTimeout();
  }

  public async save(): Promise<void> {
    if (!this.client.isLogin) return;
    const fightInfo = this.client.profile.fight;
    fightInfo.id = this.id;
    fightInfo.index = this.index;
    fightInfo.hp = this.hp;
    fightInfo.mana = this.mana;
    fightInfo.stamina = this.stamina;
    fightInfo.characterId = this.characterId;
    fightInfo.characterSkinId = this.characterSkinId;
    fightInfo.specialActionCharge = this.specialActionCharge;
    await this.client.save();
  }

  public async load(): Promise<void> {
    if (!this.client.isLogin) return;
    const fightInfo = this.client.profile.fight;
    this.id = fightInfo.id;
    this.index = fightInfo.index;
    this.setCharacter(fightInfo.characterId, fightInfo.characterSkinId);
    this.setHp(fightInfo.hp);
    this.setMana(fightInfo.mana);
    this.setStamina(fightInfo.stamina);
  }

  public async leave(): Promise<void> {
    await this.save();

    this.instance?.leavePlayer(this.client);
  }

  public setCharacter(characterId: number, skinId: number): void {
    this.characterId = characterId;
    this.characterSkinId = skinId;
    this.characterInfo = characterInfoGetById(characterId);

    if (!this.characterInfo) {
      Logger.warn(`Character loading failed, reason: client ${this.client.username} set wrong CharacterId (${this.characterId}); Set defaultCharacterId: ${defaultCharacterId}`);
      this.characterInfo = characterInfoGetById(defaultCharacterId);
    }

    this.hpMax = this.characterInfo.hpMax;
    this.manaMax = this.characterInfo.manaMax;
    this.staminaMax = this.characterInfo.staminaMax;
  }

  public setAction(action: actionType) {
    this.action = action;
    this.client.sendFightAction(action, target.self);
  }

  public setPower(power: number) {
    this.power = power;
    this.client.sendFightPower(power, target.self);
  }

  public setSpecialActionCharge(charge: number) {
    this.specialActionCharge = Math.clamp(charge, 0, 100);
  }

  public setHp(hp: number) {
    this.hp = Math.clamp(hp, 0, this.hpMax);
  }

  public addHp(hp: number) {
    this.setHp(this.hp + Math.abs(hp));
  }

  public removeHp(hp: number) {
    this.setHp(this.hp - Math.abs(hp));
  }

  public setMana(mana: number) {
    this.mana = Math.clamp(mana, 0, this.manaMax);
  }

  public addMana(mana: number) {
    this.setMana(this.mana + Math.abs(mana));
  }

  public removeMana(mana: number) {
    this.setMana(this.mana - Math.abs(mana));
  }

  public setStamina(stamina: number) {
    this.stamina = Math.clamp(stamina, 0, this.staminaMax);
  }

  public addStamina(stamina: number) {
    this.setStamina(this.stamina + Math.abs(stamina));
  }

  public removeStamina(stamina: number) {
    this.setStamina(this.stamina - Math.abs(stamina));
  }

  public setSoulData(x: number, y: number, angle: number, ability: number) {
    this.soul.x = x;
    this.soul.y = y;
    this.soul.angle = angle;
    this.soul.ability = ability;
  }

  public startResponceTimeout() {
    this.responceTimeout = setTimeout(() => {
      this.instance.kickPlayer(this.client);
    }, 6_000);
  }

  public stopResponceTimeout() {
    clearTimeout(this.responceTimeout);
    this.responceTimeout = null;
  }

  public response() {
    if (!this.instance) {
      return;
    }

    if (this.removed) {
      this.instance.clientAdd(this.client);
    }

    this.stopResponceTimeout();
    this.startResponceTimeout();
  }

  public async tryRestore() {
    if (!this.client || !this.client.isLogin) return;
    const profile = this.client.profile;

    if (!profile.fight.id) {
      Logger.debug('Fight no exists, restore end');
      return;
    }

    const fight = Matchmaker.findFight(profile.fight.id);
    if (!fight) {
      this.unit();
      await this.save();

      Logger.debug('Fight no longer exists, cancellation of resumption!');
      return;
    }

    this.id = profile.fight.id;
    this.index = profile.fight.index;
    this.init(fight, this.index);
    await this.load();

    fight.setState(state.choose);
    fight.timeoutClear();
    fight.clientAdd(this.client);

    const info = fight.getOtherClient(this.client)?.fight.info;
    this.client.sendFightCharacter();
    this.client.sendFightJoin(statusCode.success, info);

    fight.sync();
    Logger.debug('Restore fight successful!');
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
