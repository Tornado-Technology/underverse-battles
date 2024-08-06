if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(point_distance(x, y, obj_battle_border.x, y) <= 20) {
	if(!touching_walls) {
		touching_walls = true;
	};
};


if (ricochet && touching_walls && !is_destroying){
	collision();
	touching_walls = false;
};

if (is_destroying) {
	touching_walls = false;
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();
	};	
}