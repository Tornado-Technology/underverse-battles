import Client, { state as clientState } from '../../concepts/client/client.js';
import Logger from '../../util/logging.js';
import App from '../../app.js';
import Matchmaker from '../../util/matchmaker.js';
import { statusCode } from '../../status.js';
import config from '../../config.js';

export enum state {
  wait = 'wait',
  choose = 'choose',
  battle = 'battle',
  reset = 'reset'
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
  protected skipCount: number;

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
    this.skipCount = 0;
    Logger.info(`Fight[${this.id}] created: ${client1?.username} vs ${client2?.username}`);
    this.initializeClients();
  }

  public async initializeClients(): Promise<void> {
    this.clients.forEach((client, index) => {
      client.fight.init(this, index);
      client.sendFightJoin(statusCode.success, this.getOtherClient(client).fight.info);
      client.fight.startResponceTimeout();
    });
    await Matchmaker.removeRating(this.clients);

    this.setState(state.choose);
    this.setInitiative(this.initiative);
  }

  private timeoutStart(method: Function): void {
    if (this.destroyTimeout) return;
    // @ts-ignore
    this.destroyTimeout = setTimeout(method, config.gameplay.fight.disconnectTimeout);
  }

  public timeoutClear() {
    if (!this.destroyTimeout) return;
    clearTimeout(this.destroyTimeout);
    this.destroyTimeout = null;
  }

  public leavePlayer(client: Client): void {
      const winnerClient = this.clients.find((c) => c);
      this.finish(winnerClient);
      winnerClient?.sendFightDisconnect(target.opponent);
      client?.sendFightDisconnect(target.self);
  }

  public kickPlayer(client: Client): void {
    this.timeoutStart(async () => {
      this.leavePlayer(client);
      Logger.debug(`${client?.account.username} was kicked from fight.`);
    });

    this.clientRemove(client);
  }

  public clientRemove(client: Client): void {
    Logger.debug(`${client?.account.username} left.`);
    client.fight.removed = true;
    this.getOtherClient(client)?.sendFightClientRemove();
  }

  public clientAdd(client: Client) {
    Logger.debug(`${client?.username} is back.`);
    this.clients[client?.fight.index] = client;

    const otherClient = this.getOtherClient(client);
    otherClient?.sendFightClientAdd();

    client.fight.removed = false;

    if (this.state !== state.battle) {
      return;
    }

    if (otherClient.fight.action === actionType.specialAttack) {
      this.addSpecialActionCharge(otherClient, 100);
      return;
    }

    const mana = otherClient?.fight.characterInfo.staminaCost[otherClient?.fight.action - actionType.attack1];
    const stamina = otherClient?.fight.characterInfo.manaCost[otherClient?.fight.power];

    this.addMana(otherClient, mana);
    this.addStamina(otherClient, stamina);
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

  public setState(newState: state): void {
    this._state = newState;
    Logger.debug(`Fight[${this.id}] set new state "${newState}"`);
  }

  public async finish(winner: Client): Promise<void> {
    const rating = await Matchmaker.addRating(winner);
    this.clients.forEach((client) => {
      const isWinner = client === winner;
      client?.fight.unit();
      client?.setState(clientState.inMenu);
      client?.sendFightFinished(isWinner ? rating : -rating, isWinner);
    });
    this.destroy();
  }

  public async finishInDraw(): Promise<void> {
    this.clients.forEach((client) => {
      client?.fight.unit();
      client?.setState(clientState.inMenu);
      Matchmaker.returnRating(client);
      client?.sendFightFinished(0, false);
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

  public async onHpModify(client: Client): Promise<void> {
    if (client?.fight.hp <= 0) {
      await this.finish(this.getOtherClient(client));
    }
  }

  public setInitiative(initiative: number): void {
    this.initiative = initiative;
    this.clients[0].sendFightInitiative(initiative);
    this.clients[1].sendFightInitiative(1 - initiative);
    Logger.debug(`Fight[${this.id}] set new initiative: ${this.clients[0].username}: ${initiative}, ${this.clients[1].username}: ${1 - initiative}`);
  }

  public setClientAction(client: Client, action: number): void {
    client?.fight.setAction(action);
    this.getOtherClient(client)?.sendFightAction(action, target.opponent);
    Logger.debug(`Action: ${action} "${client?.username}"`);
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

    Logger.debug(`Fight client: ${client?.username}, set action: ${action}`);

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

    if (activePlayer?.fight.action !== actionType.skip && activePlayer?.fight.action !== actionType.specialAttack) {
      this.removeStamina(activePlayer, activePlayer?.fight.characterInfo.staminaCost[activePlayer?.fight.action - actionType.attack1]);
      this.removeMana(activePlayer, activePlayer?.fight.characterInfo.manaCost[activePlayer?.fight.power]);
    }

    this.addSpecialActionCharge(activePlayer, activePlayer?.fight.characterInfo.specialActionChargePerTurn ?? 0);

    if (this.clients[0]?.fight.action === actionType.skip && this.clients[1]?.fight.action === actionType.skip) {
      this.skipCount++;
      if (this.skipCount === config.gameplay.fight.maxSkipCount) {
        this.finishInDraw();
      }
    }
    else {
      this.skipCount = 0;
    }

    if ((this.clients[0]?.fight.action === this.clients[1]?.fight.action || activePlayer?.fight.action === actionType.skip) && activePlayer?.fight.action !== actionType.specialAttack) {
      this.updateStateDefend();
      return;
    }

    this.updateStateAttack();
  }

  public setSpecialActionCharge(client: Client, charge: number): void {
    client?.fight.setSpecialActionCharge(charge);
    const newCharge = client?.fight.specialActionCharge;
    client?.sendFightSpecialActionCharge(newCharge, target.self);
    this.getOtherClient(client)?.sendFightSpecialActionCharge(newCharge, target.opponent);
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

    this.clients.forEach((client) => {
      client?.sendFightStartBattle();
    });
  }

  public updateStateDefend(): void {
    this.clients.forEach((client) => {
      client?.sendFightDodge();
    });
    this.resetState();
  }

  public battleFinish(client: Client, damage: number) {
    if (this.state == state.battle) {
      this.resetState();
    }

    const otherClient = this.getOtherClient(client);
    otherClient.sendFightBattleEnd(damage);
  }

  public async setHp(client: Client, hp: number): Promise<void> {
    client?.fight.setHp(hp);
    this.syncHp(client);
    await this.onHpModify(client);
  }

  public async addHp(client: Client, hp: number): Promise<void> {
    client?.fight.addHp(hp);
    this.syncHp(client);
    await this.onHpModify(client);
  }

  public async removeHp(client: Client, hp: number): Promise<void> {
    client?.fight.removeHp(hp);
    this.syncHp(client);
    await this.onHpModify(client);
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

  public transferDataFromClient(sendingClient: Client, index: string, data: any): void {
    const otherClient = this.getOtherClient(sendingClient);
    otherClient?.sendDataToClient(index, data);
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
}
