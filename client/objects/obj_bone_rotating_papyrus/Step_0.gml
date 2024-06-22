image_angle += speed_const * dtime;

if (scale_time > 0) {
	image_xscale = approach(image_xscale, scale_const, scale_time * dtime);	
}


if (image_angle >= 360) {
	image_angle = 0;
	rotating--;
}
	

if (rotating == 0) {
	var target = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	motion_set(target, speed_const * dtime);
	rotating = -1;
}

if (rotating == -1) {
	motion_set(direction, speed_const * dtime);
}

	
