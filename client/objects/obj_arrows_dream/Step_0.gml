if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(place_meeting(x, y, obj_battle_border)) {
	if(!touching_walls) {
		touching_walls = true;
		return;	
	};
};

if (ricochet && touching_walls) {
	collision();
};