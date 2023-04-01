event_inherited();

if (time_source_get_state(time_source_flying) == time_source_state_active ||
	time_source_get_state(time_source_charging) == time_source_state_active) {
	image_angle = lerp(image_angle, point_direction(x, y, x_dir, y_dir) + 90, 0.2 * dtime);
}