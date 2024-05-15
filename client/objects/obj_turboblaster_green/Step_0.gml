if (!started) {
	time_source_start(time_source_flying);
	started = true;
}

step = 0.4 * dtime;

if (time_source_get_state(time_source_flying) == time_source_state_active) {
	x = lerp(x, target_x, step);
	y = lerp(y, target_y, step);
}