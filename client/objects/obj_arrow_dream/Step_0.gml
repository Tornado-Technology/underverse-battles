if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(!start_timer) {
	if(place_meeting(x, y, obj_solid)) {
		time_source_start(time_source_touching);
		start_timer = true;
	};
};

if (ricochet && touching_walls && !be_ricochet) {
	collision();
};