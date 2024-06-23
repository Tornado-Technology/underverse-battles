event_inherited();

if (is_holding) exit;

if (speed_const > 0) {
	speed_const -= 0.01 * dtime;
	rotation += rotation_speed;
	rotation_speed = approach(rotation_speed, 0, 0.01 * dtime);
}
else {
	speed_const = 0;
}
speed = speed_const * dtime;

if (height > 0) {
	height += current_force;
	current_force -= 0.1 * dtime;
}
else {
	if (height < 0) {
		height = 0;
	}
	if (!has_first_fall) {
		obj_volleyball_minigame.on_fall_ball.invoke();
		has_first_fall = true;
	}
	if (force > 1) {
		force /= 2;
		current_force = force - 0.1;
		height += current_force;
	}
}

if (y >= 112 && y <= 128) {
	if (height < object_get_sprite_size(obj_volleyball_net).y && !is_higher) {
		direction = -direction;
	}
	is_higher = true;
}