export default class Rank {
  public readonly min: number;
  public readonly max: number;
  public readonly limit: number;

  constructor(min: number, max: number, clamp: number) {
    this.min = min;
    this.max = max;
    this.limit = clamp;
  }

  public belongs(x: number): boolean {
    return x >= this.min && x <= this.max;
  }

  public clamp(x: number, limited: number): number {
    return this.belongs(x) ? (Math.min(limited, this.limit)) : x;
  }
}

var zx = obj_mobilecontrols.zx
var zy = obj_mobilecontrols.zy
z_button = virtual_key_add(zx, zy, (sprite_get_width(spr_z_button) * obj_mobilecontrols.z_scale), (sprite_get_width(spr_z_button) * obj_mobilecontrols.z_scale), 90)
