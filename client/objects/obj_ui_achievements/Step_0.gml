// @desc animate
if (text_progress == 4) {
	x = lerp(x, width + sprite_border_width * scale, 0.1);
	
	alpha = lerp(alpha, 0, 0.1);
	
	if (alpha == 0) {
		instance_destroy();
	}
} else {
	x = lerp(x, width, 0.1);
	
	alpha = lerp(alpha, 1, 0.1);
}

// Alpha text
if (alpha < 1) exit;

if (text_progress == 0 || text_progress == 2) {
	alpha_text = lerp(alpha_text, 1, 0.06);
	
	if (text_progress == 2) {
		text = achievement.name;
	}
	
	if (alpha_text >= 1) {
		text_progress++;
	}
}

if (text_progress == 1 || text_progress == 3) {
	alpha_text = lerp(alpha_text, 0, 0.08);
	
	if (alpha_text <= 0) {
		text_progress++;
	}
}