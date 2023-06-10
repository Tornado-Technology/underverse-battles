import { accountType } from '../../../database/schemas/account.js';
import ClientFight from '../clientFight.js';

export default class ClientFightInfo {
  public readonly id: string;
  public readonly characterId: number;
  public readonly characterSkinId: number;
  public readonly name: string;
  public readonly rating: number;
  public readonly type: accountType;
  public readonly badge: number | null;

  constructor(fight: ClientFight) {
    this.id = fight.id;
    this.characterId = fight.characterId;
    this.characterSkinId = fight.characterSkinId;
    this.name = fight.client.nickname;
    this.rating = fight.client.rating;
    this.type = fight.client.account.type;
    this.badge = fight.client.badge;
  }
}
