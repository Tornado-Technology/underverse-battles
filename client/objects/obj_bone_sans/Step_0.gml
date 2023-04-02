if (!can_move) exit;

speed = speed_const * dtime;

if (scale_time > 0) {
	image_yscale = lerp(image_yscale, scale_const, scale_time * dtime);
}