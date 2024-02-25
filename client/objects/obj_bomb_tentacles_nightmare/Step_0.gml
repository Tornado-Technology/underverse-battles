y = approach(y, target_position, speed_const * dtime);

if (y == target_position) {
	spwan();
	instance_destroy();	
}