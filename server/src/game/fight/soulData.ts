export default class SoulData {
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
