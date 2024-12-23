if (!can_move) exit;

// Movement

if (!is_accelerating) {
	speed = speed_const * dtime;
}

if (scale_time > 0) {
	image_yscale = lerp(image_yscale, scale_const, scale_time * dtime);
}

// Accelerate

if (is_accelerating) {
	if (speed < speed_const) {
		speed += accelerate * dtime;
	}
}

// Shake

shake_position_x = 0;
shake_position_y = 0;
if (is_shaking) {
	shake_position_x = irandom_range(-shake_power, shake_power);
	shake_position_y = irandom_range(-shake_power, shake_power);
}
x += shake_position_x;
y += shake_position_y;