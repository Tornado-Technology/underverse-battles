depth = -y;

if (is_holding) exit;

if (speed_const > 0) {
	speed_const -= step * dtime;
	rotation += rotation_speed;
	rotation_speed = approach(rotation_speed, 0, step * dtime);
}
else {
	speed_const = 0;
}
speed = speed_const * dtime;

if (height > 0) {
	height += current_force;
	current_force -= step_force * dtime;
}
else {
	if (height < 0) {
		height = 0;
	}
	if (!has_first_fall) {
		if (is_for_minigame) obj_volleyball_minigame.on_fall_ball.invoke();
		has_first_fall = true;
	}
	if (force > 1) {
		force /= 2;
		current_force = force - step_force;
		height += current_force;
	}
}

if (y >= 112 && y <= 128) {
	if (height < object_get_sprite_size(obj_volleyball_net).y && !is_higher) {
		direction = -direction;
	}
	is_higher = true;
}