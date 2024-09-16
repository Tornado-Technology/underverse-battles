event_inherited();

// Cutscene moving
if (is_moving) {
	x = approach(x, x_new, speed_const * dtime);
	y = approach(y, y_new, speed_const * dtime);
	
	if (x == x_new && y == y_new) {
		is_moving = false;
	}
}