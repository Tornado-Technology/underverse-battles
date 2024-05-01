event_inherited();

if (is_target) {
	direction = point_direction(x, y, on_target.x, on_target.y);	
}


if (moving) {
	y = approach(y, move, speed_const * dtime);			
};