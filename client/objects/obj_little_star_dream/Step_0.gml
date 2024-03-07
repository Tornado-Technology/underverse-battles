event_inherited();

if (time_source_get_state(time_source_destroy_star) == time_source_state_stopped) {
	image_alpha -= 0.1 * dtime;
	if (image_alpha <= 0) {
		instance_destroy();	
	}
}