if (target_position == undefined) {
	instance_destroy();
}

if (additional_speed > 0) {
	additional_speed = approach(additional_speed, 0, delta_speed);
	additional_speed = max(additional_speed, 0);
}

if (is_moving) {
	motion_set(_angle, _speed + additional_speed);
}

if (point_distance(x, y, target_position.x, target_position.y) <= target_position_offset) {
	spawn_mini_fireballs();
	instance_destroy();
}

image_angle += _speed;