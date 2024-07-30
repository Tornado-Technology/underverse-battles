if (!move) exit;

motion_set(image_angle, speed_const * dtime);
if(collision_circle(x, y, 30, obj_battle_border, false, false)) {
	if(!touching_walls) {
		touching_walls = true;
		return;	
	};
};


if (ricochet && touching_walls && !be_ricochet) {
	collision();
};