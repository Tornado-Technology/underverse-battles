if (can_move) {
	motion_set(_angle, const_speed * dtime);
}

if (has_fixed_movement) {
	if	(x > x_station_right && speed > 0) ||
		(x < x_station_left && speed < 0) {
		const_speed = -const_speed;
	}
}

if	(x > obj_battle_border.x + obj_battle_border.right + 5 * image_xscale && speed > 0) ||
	(x < obj_battle_border.x - obj_battle_border.left - 5 * image_xscale && speed < 0) {
	instance_destroy();
}