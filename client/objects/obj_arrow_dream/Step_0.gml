if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(point_distance(x, y, obj_battle_border.x, y) <= 20) {
	if(!touching_walls) {
		touching_walls = true;
	};
};


if (ricochet && touching_walls && !be_ricochet) {
	collision();
};