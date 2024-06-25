interface Math {
  randomRange(min: number, max: number): number;
  clamp(val: number, min: number, max: number): number;
  lerp(start: number, target: number, amount: number): number;
  approach(start: number, target: number, amount: number): number;
  degToRad(deg: number): number;
  radToDeg(rad: number): number;
}

Math.randomRange = (min: number, max: number): number => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

Math.clamp = (val: number, min: number, max: number): number => Math.min(Math.max(val, min), max);

Math.lerp = (start: number, target: number, amount: number): number => start + (target - start) * amount;

Math.approach = (start: number, target: number, amount: number): number => start < target ? Math.min(start + amount, target) : Math.max(start - amount, target);

Math.degToRad = (deg: number): number => (deg * Math.PI) / 180;

Math.radToDeg = (rad: number): number => (rad * 180) / Math.PI;
