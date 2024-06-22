if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if (point_distance(x, y, obj_battle_border.x, obj_battle_border.y) < 50) {
	touching_walls = true;
};

if (ricochet && touching_walls){
	collision();
};