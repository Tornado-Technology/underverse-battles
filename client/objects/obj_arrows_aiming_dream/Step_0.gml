if (time_source_get_state(time_source_target) == time_source_state_active && !shot) {
	if (instance_exists(target)) {
		image_angle = point_direction(x, y, target.x, target.y);
	};
};

if (time_source_get_state(time_source_mover) == time_source_state_active) {
	if (got_ricocher) {
		event_user(0);
	};	
};

time_source_start(time_source_target);
time_source_start(time_source_mover);