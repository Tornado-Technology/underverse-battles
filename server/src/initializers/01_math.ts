interface Math {
  getRandomRange(min: number, max: number): number;
  clamp(val: number, min: number, max: number): number;
  lerp(start: number, target: number, amount: number): number;
  approach(start: number, target: number, amount: number): number;
  degtorad(deg: number): number;
  radtodeg(rad: number): number;
}

Math.getRandomRange = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

Math.clamp = (val, min, max) => {
  if (val < min) {
    return min;
  }

  if (val > max) {
    return max;
  }

  return val;
};

Math.lerp = (start, target, amount) => {
  return start + (target - start) * amount;
};

Math.approach = (start, target, amount) => {
  if (start < target) {
    return Math.min(start + amount, target);
  }
  if (start > target) {
    return Math.max(start - amount, target);
  }
  return start;
};

Math.degtorad = (deg) => {
  return (deg * Math.PI) / 180;
}

Math.radtodeg = (rad) => {
  return (rad * 180) / Math.PI;
}