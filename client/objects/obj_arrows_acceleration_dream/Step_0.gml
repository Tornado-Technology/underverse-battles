if (point_distance(x, y, obj_battle_border.x, obj_battle_border.y) < 30) {
	touching_walls = true;
};

if (touching_walls) {
	collision();
};

if (!move) exit;

motion_set(image_angle, speed_const * dtime);


