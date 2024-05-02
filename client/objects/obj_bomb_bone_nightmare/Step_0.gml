y = approach(y, target_position.y, speed_const * dtime);
x = approach(x, target_position.x, speed_const * dtime);

if (x == target_position.x && y == target_position.y) {
	spwan();	
	instance_destroy();
};
