if (!move) exit;

	if(position_left) {
		if (collision_line(x + (half_width), y , x, room_width, obj_solid, false, false) != noone) {
				touching_walls = true;
		};
	} else {
		if (collision_line(x + (half_width), y , room_width / 20, y, obj_solid, false, false) != noone) {
			touching_walls = true;
		};	
	}

motion_set(image_angle, speed_const * dtime);
		

if (touching_walls && !be_ricochet) {
	collision();
};

if(is_bonb) {
	speed_const = 0;
	alpha = approach(alpha, 0, alpha_time);
	radius++;
	
	if (alpha == 0) {
		instance_destroy();
	};		
};