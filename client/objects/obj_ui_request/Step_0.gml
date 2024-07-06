// @desc animate
if (text_progress == 0) {
	x = lerp(x, 0, 0.2);
	alpha = lerp(alpha, 1, 0.2);
} else {
	x = lerp(x, -sprite_border_width * scale, 0.2);
	alpha = lerp(alpha, 0, 0.2);
	
	if (x == -sprite_border_width * scale) {
		instance_destroy();
	}
}