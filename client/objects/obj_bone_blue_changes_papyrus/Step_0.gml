if (!can_move) exit;

speed = speed_const * dtime;

if (scale_time > 0) {
	image_yscale = approach(image_yscale, current_scale, scale_time * dtime);
}
if (image_yscale >= current_scale) {
	current_scale = min_scale;	
}
if (image_yscale <= current_scale) {
	current_scale = max_scale;
}