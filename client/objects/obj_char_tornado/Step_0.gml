event_inherited();
if (dodging) {
	dodging_time++;
	if (dodging_time > 60) {
		dodging = false;
		sprite_index = spr_tornado_idle;
	}
}

x = lerp(x, xstart - (dodging ? 20 : 0) * image_xscale, 0.4);
