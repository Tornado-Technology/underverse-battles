if (!move) exit;
motion_set(image_angle, speed_const * dtime);

if (time_source_get_state(time_source_ricochet) == time_source_state_active) {
	if (got_ricocher) {
	 event_user(1);
	};
};

time_source_start(time_source_ricochet);