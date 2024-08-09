if (capture) {
	y += speed_count * dtime;
	
	obj_battle_soul.x = approach(obj_battle_soul.x, x, speed_count * dtime);
	obj_battle_soul.y = approach(obj_battle_soul.y, y, 2 + speed_count * dtime);
	obj_battle_soul.image_alpha = 0;
}
if (!capture && !destroy) {
	y -= speed_count * dtime;
}

if (destroy) {
	if (place_meeting(x , y - sprite_get_height(sprite_index), obj_slime_nightmare)) {	
		obj_battle_soul.image_alpha = 1;
		instance_destroy();	
	}
}