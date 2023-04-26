/// @description Movement
if (moving) {
	x = approach(x, x_new, speed_const * dtime);
	y = approach(y, y_new, speed_const * dtime);
	
	if (x == x_new && y == y_new) {
		moving = false;
	}
}