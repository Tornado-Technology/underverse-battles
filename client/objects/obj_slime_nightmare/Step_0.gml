image_yscale = approach(image_yscale, back ? back_const : scale_const, scale_time * dtime);

if  (image_yscale >= scale_const) {
	back = true;	
}
else if (image_yscale <= back_const) {
	back = false;	
}

if (instance_exists(obj_battle_soul)) {
	if (place_meeting(x, y, obj_battle_soul)) {
		obj_battle_soul.image_alpha = 0;
	}
	else {
		obj_battle_soul.image_alpha = 1;	
	};
	
}

//if(move_circle) {
	
//	x = center_x + dcos(angle) * radius;
//	y = center_y + -dsin(angle) * radius;
	
//	angle += speed_spning * dtime;
//};