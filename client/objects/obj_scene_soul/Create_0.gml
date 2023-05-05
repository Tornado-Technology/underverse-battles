y0 = y;
anim_shift = 5;

stage = 0;
time = 0;

speed_const = 0;

animating = true;

collider_switch = false;
collider_delay = 20;
collider_alpha = 0;

is_moving = false;
move_x = 0;
move_y = 0;
speed_const = 0;
angle_const = 0;

move = function(_x, _y, _speed) {
	is_moving = true;
	move_x = _x;
	move_y = _y;
	speed_const = _speed;
	direction = point_direction(x, y, move_x, move_y);
}