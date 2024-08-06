if (!move) exit;


if(point_distance(x, y, obj_battle_border.x, y) <= 20) {
	if(!touching_walls) {
		touching_walls = true;
	};
};

if (touching_walls && !be_ricochet) {
	collision();
};

if(is_bonb) {
	alpha = approach(alpha, 0, alpha_time);
	radius++;
	
	if (alpha == 0) {
		instance_destroy();
	};		
} else {
	motion_set(image_angle, speed_const * dtime);	
	
}