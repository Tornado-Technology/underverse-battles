fly_step = fly_step_const * dtime;
flyout_step = flyout_step_const * dtime;

if (time_source_get_state(time_source_flying) == time_source_state_active ||
	time_source_get_state(time_source_charging) == time_source_state_active) {
	x = lerp(x, final_position_x, fly_step);
	y = lerp(y, final_position_y, fly_step);
	if (instance_exists(charge_instance)) {
		charge_instance.x = x;
		charge_instance.y = y;
	}
}

if (time_source_get_state(time_source_flying_out) == time_source_state_active ||
	time_source_get_state(time_source_destroying) == time_source_state_active) {
	x = lerp(x, xstart, flyout_step);
	y = lerp(y, ystart, flyout_step);
	if (instance_exists(blast_instance)) {
		blast_instance.x = x;
		blast_instance.y = y;
	}
}

if (time_source_get_state(time_source_destroying) == time_source_state_active) {
	image_alpha -= flyout_step;
}