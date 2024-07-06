if (time_source_get_state(time_source_zone) == time_source_state_active) {
	image_xscale += 0.05 * dtime;
	image_yscale += 0.05 * dtime;
}
if (time_source_get_state(time_source_end) == time_source_state_active) {
	image_xscale -= 0.05 * dtime;
	image_yscale -= 0.05 * dtime;
}