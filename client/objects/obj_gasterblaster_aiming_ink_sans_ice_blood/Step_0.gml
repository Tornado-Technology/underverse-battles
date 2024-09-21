event_inherited();

event_inherited();

if (time_source_get_state(time_source_flying) == time_source_state_active ||
	time_source_get_state(time_source_charging) == time_source_state_active) {
	image_angle = lerp(image_angle, point_direction(x, y, target_x, target_y) + 90 + fight_random_integer(-max_spread, max_spread), fly_step);
}