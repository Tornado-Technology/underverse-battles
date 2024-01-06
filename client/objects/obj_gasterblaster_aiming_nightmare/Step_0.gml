if (!started) {
	time_source_start(time_source_flying);
	started = true;
}

step = 0.1 * dtime;

if (time_source_get_state(time_source_flying) == time_source_state_active) {
	x = lerp(x, x_dir, step);
	y = lerp(y, y_dir, step);
}

if (time_source_get_state(time_source_target) == time_source_state_active) {
	if (instance_exists(target))
		image_angle = point_direction(x, y, target.x, target.y) + 90;
}