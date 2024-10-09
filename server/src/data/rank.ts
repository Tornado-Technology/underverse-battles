export default class Rank {
  public readonly min: number;
  public readonly max: number;
  public readonly minLimit: number;
  public readonly maxLimit: number;

  constructor(min: number, max: number, minLimit: number, maxLimit: number) {
    this.min = min;
    this.max = max;
    this.minLimit = minLimit;
    this.maxLimit = maxLimit;
  }

  public belongs(x: number): boolean {
    return x >= this.min && x <= this.max;
  }

  public clamp(x: number, points: number): number {
    return this.belongs(x) ? (Math.clamp(points, this.minLimit, this.maxLimit)) : 0;
  }
}