if (touching_walls) {
	collision();
} else {
	if (time_source_get_state(time_source_touching_walls) == time_source_state_initial) {
		if	(place_meeting(x, y, obj_solid)) {
			time_source_start(time_source_touching_walls);
		};
	};
};

if (!move) exit;

motion_set(image_angle, speed_const * dtime);


