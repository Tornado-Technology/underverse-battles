if (!move) exit;
motion_set(image_angle, speed_const * dtime);

if (got_ricocher) {
	event_user(0);
};
