// @desc animate
if (text_progress == 1) {
	x = lerp(x, width + sprite_border_width * scale, 0.2);
	alpha = lerp(alpha, 0, 0.2);
} else {
	x = lerp(x, width, 0.2);
	alpha = lerp(alpha, 1, 0.2);
}

if (x == width + sprite_border_width * scale) {
	instance_destroy();
}