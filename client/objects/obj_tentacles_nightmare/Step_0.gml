if (time_source_start(time_source_target) == time_source_state_active) {

	x = lerp(x, tc_x, step * dtime);
	y = lerp(y, tc_y, step * dtime);

};

step = 0.4 * dtime;

motion_set(direction, speed_const * dtime);

time_source_start(time_source_target);