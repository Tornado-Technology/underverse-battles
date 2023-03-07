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

Math.clamp = (val: number, min: number, max: number): number  => {
  return val < min ? min : max;
}

Math.lerp = (start: number, target: number, amount: number): number  => {
  return start + (target - start) * amount;
}

Math.approach = (start: number, target: number, amount: number): number  => {
  return start < target ? Math.min(start + amount, target) : Math.max(start - amount, target);
}

Math.degToRad = (deg: number): number  => {
  return (deg * Math.PI) / 180;
}

Math.radToDeg = (rad: number): number  => {
  return (rad * 180) / Math.PI;
}
