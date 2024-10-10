export default class CharacterInfo {
  public readonly characterId: number;
  public readonly characterSkinId: number;
  public readonly hpMax: number;
  public readonly staminaMax: number;
  public readonly manaMax: number;
  public readonly staminaRegen: number;
  public readonly staminaCost: number[];
  public readonly manaCost: number[];
  public readonly specialActionChargePerTurn: number;

  constructor(characterId: number, characterSkinId: number, hpMax: number, staminaMax: number, manaMax: number, staminaRegen: number, staminaCost: number[], manaCost: number[], specialActionChargePerTurn: number = 5, specialActionChargePerDamage: number = 1) {
    this.characterId = characterId;
    this.characterSkinId = characterSkinId;
    this.hpMax = hpMax;
    this.staminaMax = staminaMax;
    this.manaMax = manaMax;
    this.staminaRegen = staminaRegen;
    this.staminaCost = staminaCost;
    this.manaCost = manaCost;
    this.specialActionChargePerTurn = specialActionChargePerTurn;
  }
}
