event_inherited();

if (moving) {
	y = approach(y, move, speed_const * dtime);			
}

if (destroy_left) {
	if (x < obj_battle_border.x - obj_battle_border.left - 5) {
		instance_destroy();	
	}
}

