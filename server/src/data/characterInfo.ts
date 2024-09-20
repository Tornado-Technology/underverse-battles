export default class CharacterInfo {
  public readonly id: number;
  public readonly hpMax: number;
  public readonly staminaMax: number;
  public readonly manaMax: number;
  public readonly staminaRegen: number;
  public readonly staminaCost: number[];
  public readonly manaCost: number[];
  public readonly specialActionChargePerTurn: number;
  public readonly specialActionChargePerDamage: number;

  constructor(id: number, hpMax: number, staminaMax: number, manaMax: number, staminaRegen: number, staminaCost: number[], manaCost: number[], specialActionChargePerTurn: number = 5, specialActionChargePerDamage: number = 1) {
    this.id = id;
    this.hpMax = hpMax;
    this.staminaMax = staminaMax;
    this.manaMax = manaMax;
    this.staminaRegen = staminaRegen;
    this.staminaCost = staminaCost;
    this.manaCost = manaCost;
    this.specialActionChargePerTurn = specialActionChargePerTurn;
    this.specialActionChargePerDamage = specialActionChargePerDamage;
  }
}
