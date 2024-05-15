event_inherited();

if (is_target) {
	direction = point_direction(x, y, on_target.x, on_target.y);	
}


if (scale_time > 0) {
	image_xscale = approach(image_xscale, scale_const, scale_time * dtime);	
}



if (moving) {
	y = approach(y, move, speed_const * dtime);			
};

if (destroy_left) {
	if (x < obj_battle_border.x - obj_battle_border.left - 5) {
		instance_destroy();	
	};
};

