import { accountType } from '../../schemas/account.js';
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
    this.name = fight.client.username;
    this.rating = fight.client.rating;
    this.badge = fight.client.badge;
  }
}
