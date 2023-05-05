/// @description Movement

if (!is_moving) exit;

if (x < move_x && y < move_y) {
	speed = speed_const * dtime;
}
else {
	speed = 0;
	is_moving = false;
}
