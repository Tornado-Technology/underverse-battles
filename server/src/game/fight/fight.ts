import Client, { state as clientState } from '../../concepts/client.js';
import Logger from '../../util/logging.js';
import App from '../../app.js';
import Matchmaker from '../../util/matchmaker.js';
import { statusCode } from '../../status.js';

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

export enum actionType {
  empty,
  skip,
  attack1,
  attack2,
  attack3,
  specialAttack,
}

export default class Fight {
  protected _id: string;
  protected clients: Client[];
  protected _state: state;
  protected initiative: number;
  protected timeout: NodeJS.Timeout;
  protected destroyTimeout: NodeJS.Timeout;

  public static create(client1: Client, client2: Client): void {
    const fight = new Fight(client1, client2, String(Date.now()));
    App.fights.push(fight);
  }

  public static destroy(fight: Fight): void {
    App.fights.splice(App.fights.indexOf(fight), 1);
    Logger.info(`Fight[${fight.id}] destroyed`);
  }

  constructor(client1: Client, client2: Client, id: string) {
    this._id = id;
    this._state = state.wait;
    this.clients = [client1, client2];
    this.initiative = Math.randomRange(0, 1);
    Logger.info(`Fight[${this.id}] created, ${client1?.account.username} vs ${client2?.account.username}`);
    this.initializeClients();
  }

  public initializeClients(): void {
    this.clients.forEach((client, index) => {
      client.fight.init(this, index);
      client.sendFightJoin(statusCode.success, this.getOtherClient(client).fight.info);
    });

    this.setState(state.choose);
    this.setInitiative(this.initiative);
  }

  public destroy(): void {
    Fight.destroy(this);
  }

  public get id(): string {
    return this._id;
  }

  public get state(): state {
    return this._state;
  }

  public setState(state: state): void {
    this._state = state;
    Logger.debug(`Fight[${this.id}] set new state "${state}"`);
  }

  public finish(winner: Client): void {
    const rating = Matchmaker.addRating(winner, this.getOtherClient(winner));
    this.clients.forEach((client) => {
      const isWinner = client === winner;
      client.fight.unit();
      client.setState(clientState.inMenu);
      client.sendFightFinished(isWinner ? rating : -rating, isWinner);
    });
    this.destroy();
  }

  public hasClient(client: Client): boolean {
    return client && this.clients.find((c) => c === client) !== undefined;
  }

  public getOtherClient(client: Client): Client {
    return this.clients.find((c) => c !== client);
  }

  public get activeClient(): Client {
    return this.clients[this.initiative];
  }

  public get inactiveClient(): Client {
    return this.clients[1 - this.initiative];
  }

  public get clientsConnected(): boolean {
    return this.clients.filter((client) => client !== undefined).length == this.clients.length;
  }

  public onHpModify(client: Client): void {
    if (client?.fight.hp <= 0) {
      this.finish(this.getOtherClient(client));
    }
  }

  public setInitiative(initiative: number): void {
    this.initiative = initiative;
    this.clients[0]?.sendFightInitiative(this.initiative);
    this.clients[1]?.sendFightInitiative(1 - this.initiative);
    Logger.debug(`Fight[${this.id}] set new initiative "${initiative}"`);
  }

  public setClientAction(client: Client, action: number): void {
    client?.fight.setAction(action);
    this.getOtherClient(client)?.sendFightAction(action, target.opponent);
    Logger.debug(`Action: ${action} "${client?.account.username}"`);
  }

  public setAction(client: Client, action: number): void {
    if (this.state !== state.choose) {
      Logger.warn(`The client tries to send his action in other state, client: ${client.uuid}.`);
      return;
    }

    if (client.fight.isChosen) {
      Logger.warn(`The client tries to send a second time his actions, client: ${client.uuid}.`);
      return;
    }

    Logger.debug(`Fight client: ${client?.account.username}, set action: ${action}`);
    this.setClientAction(client, action);
    this.updateAction();
  }

  public resetAction(client: Client): void {
    client?.fight.setAction(actionType.empty);
    client?.sendFightResetAction();
    this.updateAction();
  }

  public setClientPower(client: Client, power: number): void {
    client?.fight.setPower(power);
    this.getOtherClient(client)?.sendFightPower(power, target.opponent);
  }

  public setPower(client: Client, power: number): void {
    if (this.state === state.choose && client.fight.isChooses) {
      this.setClientPower(client, power);
    }
  }

  public resetPower(client: Client): void {
    client?.fight.setPower(0);
    client?.sendFightResetPower();
  }

  public setExtraAction(client: Client): void {
    this.getOtherClient(client)?.sendFightExtraAction();
  }

  public setClientSoulData(client: Client, x: number, y: number, angle: number, ability: number): void {
    client?.fight.setSoulData(x, y, angle, ability);
    this.getOtherClient(client)?.sendFightSoul(x, y, angle, ability, target.opponent);
  }

  public setSoulData(client: Client, x: number, y: number, angle: number, ability: number): void {
    if (this.state === state.battle) {
      this.setClientSoulData(client, x, y, angle, ability);
    }
  }

  public updateAction(): void {
    if (this.state !== state.choose) {
      return;
    }

    if (this.clients[0]?.fight.isChooses || this.clients[1]?.fight.isChooses) {
      return;
    }

    if (!this.clientsConnected) {
      return;
    }

    this.setState(state.wait);
    this.updateState();
  }

  public updateState(): void {
    if (!this.clientsConnected) return;

    const activePlayer = this.activeClient;

    if (activePlayer?.fight.action !== actionType.skip) {
      this.removeStamina(activePlayer, activePlayer?.fight.characterInfo.staminaCost[activePlayer?.fight.action]);
      this.removeMana(activePlayer, activePlayer?.fight.characterInfo.manaCost[activePlayer?.fight.power]);
    }

    Logger.debug(`Fight client: ${activePlayer?.account.username}, set specialActionChargePerTurn: ${activePlayer?.fight.characterInfo.specialActionChargePerTurn}`)
    this.addSpecialActionCharge(activePlayer, activePlayer?.fight.characterInfo.specialActionChargePerTurn ?? 0);

    if ((this.clients[0]?.fight.action === this.clients[1]?.fight.action || activePlayer?.fight.action === actionType.skip) && activePlayer?.fight.action !== actionType.specialAttack) {
      this.updateStateDefend();
      return;
    }

    this.updateStateAttack();
  }

  public setSpecialActionCharge(client: Client, charge: number): void {
    Logger.debug(`Fight client: ${client?.account.username}, set charge: ${charge}`);
    client?.fight.setSpecialActionCharge(charge);
    this.getOtherClient(client)?.sendFightSpecialActionCharge(charge, target.opponent);
  }

  public addSpecialActionCharge(client: Client, charge: number): void {
    this.setSpecialActionCharge(client, client?.fight.specialActionCharge + charge);
  }

  public resetState(): void {
    if (this.state === state.reset) return;

    this.setState(state.reset);
    Logger.debug('Reset begins.');

    if ((this.clients[0]?.fight.action === actionType.skip && this.initiative === 0) || (this.clients[1]?.fight.action === actionType.skip && this.initiative === 1)) {
      this.addStamina(this.clients[0], this.clients[0]?.fight?.characterInfo?.staminaRegen);
      this.addStamina(this.clients[1], this.clients[1]?.fight?.characterInfo?.staminaRegen);
    } else if (this.clients[0]?.fight.action === this.clients[1]?.fight.action) {
      this.addStamina(this.clients[1 - this.initiative], this.clients[1 - this.initiative]?.fight?.characterInfo?.staminaRegen);
    }

    this.setInitiative(1 - this.initiative);

    this.setState(state.choose);
    this.clients.forEach((client) => {
      this.resetAction(client);
      this.resetPower(client);
    });
  }

  public updateStateAttack(): void {
    if (this.state === state.battle) return;

    this.setState(state.battle);
    const seed = Math.randomRange(0, 2000000000);

    this.clients.forEach((client) => {
      client?.sendFightStartBattle(seed);
    });
  }

  public updateStateDefend(): void {
    this.resetState();
    this.clients.forEach((client) => {
      client?.sendFightDodge();
    });
  }

  public battleFinish() {
    if (this.state == state.battle) {
      this.resetState();
    }
  }

  public setHp(client: Client, hp: number): void {
    client?.fight.setHp(hp);
    this.syncHp(client);
    this.onHpModify(client);
  }

  public addHp(client: Client, hp: number): void {
    client?.fight.addHp(hp);
    this.syncHp(client);
    this.onHpModify(client);
  }

  public removeHp(client: Client, hp: number): void {
    client?.fight.removeHp(hp);
    this.syncHp(client);
    this.onHpModify(client);
  }

  public setMana(client: Client, mana: number): void {
    client?.fight.setMana(mana);
    this.syncMana(client);
  }

  public addMana(client: Client, mana: number): void {
    client?.fight.addMana(mana);
    this.syncMana(client);
  }

  public removeMana(client: Client, mana: number): void {
    client?.fight.removeMana(mana);
    this.syncMana(client);
  }

  public setStamina(client: Client, stamina: number): void {
    client?.fight.setStamina(stamina);
    this.syncStamina(client);
  }

  public addStamina(client: Client, stamina: number): void {
    client?.fight.addStamina(stamina);
    this.syncStamina(client);
  }

  public removeStamina(client: Client, stamina: number): void {
    client?.fight.removeStamina(stamina);
    this.syncStamina(client);
  }

  public syncHp(client: Client): void {
    const value = client?.fight.hp;
    client?.sendFightHp(value, target.self);
    this.getOtherClient(client)?.sendFightHp(value, target.opponent);
  }

  public syncMana(client: Client): void {
    const value = client?.fight.mana;
    client?.sendFightMana(value, target.self);
    this.getOtherClient(client)?.sendFightMana(value, target.opponent);
  }

  public syncStamina(client: Client): void {
    const value = client?.fight.stamina;
    client?.sendFightStamina(value, target.self);
    this.getOtherClient(client)?.sendFightStamina(value, target.opponent);
  }

  public sync(): void {
    this.setInitiative(this.initiative);
    this.setState(state.choose);
    this.clients.forEach((client) => {
      this.syncHp(client);
      this.syncMana(client);
      this.syncStamina(client);
      this.setClientAction(client, actionType.empty);
      this.setClientPower(client, 0);
    });
  }

  // TODO: ADD WORK WITH SPECIAL ATTACK
  //public setSpecialAction(client: Client, playerId: number): void {
    // client.fight
  //}
}
