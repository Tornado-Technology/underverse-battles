export default class Rank {
  public readonly minLimit: number;
  public readonly maxLimit: number;
  public readonly minReceivedPoints: number;
  public readonly maxTakenPoints: number;

  constructor(minLimit: number, maxLimit: number, minReceivedPoints: number, maxTakenPoints: number) {
    this.minLimit = minLimit;
    this.maxLimit = maxLimit;
    this.minReceivedPoints = minReceivedPoints;
    this.maxTakenPoints = maxTakenPoints;
  }

  public belongs(x: number): boolean {
    return x >= this.minLimit && x <= this.maxLimit;
  }

  public min(points: number): number {
    return Math.min(points, this.minReceivedPoints);
  }

  public max(points: number): number {
    return Math.max(points, this.maxTakenPoints);
  }
}