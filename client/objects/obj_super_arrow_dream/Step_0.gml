if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(place_meeting(x + sprite_width, y, obj_solid)) {
	if(!touching_walls) {
		touching_walls = true;
	};
};

if (touching_walls && !be_ricochet) {
	collision();
};