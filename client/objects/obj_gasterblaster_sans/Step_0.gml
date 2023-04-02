if (!started) {
	time_source_start(time_source_flying);
	started = true;
}

step = 0.1 * dtime;

if (time_source_get_state(time_source_flying) == time_source_state_active) {
	x = lerp(x, x_dir, step);
	y = lerp(y, y_dir, step);
}

if (time_source_get_state(time_source_flying_out) == time_source_state_active ||
	time_source_get_state(time_source_destroying) == time_source_state_active) {
	x = lerp(x, xstart, step);
	y = lerp(y, ystart, step);
	if (instance_exists(blast_instance)) {
		blast_instance.x = x;
		blast_instance.y = y;
	}
}

if (time_source_get_state(time_source_destroying) == time_source_state_active) {
	image_alpha -= step;
}