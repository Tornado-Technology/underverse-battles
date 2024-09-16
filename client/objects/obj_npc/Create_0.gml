image_speed = 0;

is_moving = false;

x_new = 0;
y_new = 0;
speed_const = 2;

move = function(_x, _y, _speed) {
	is_moving = true;
	x_new = x + _x;
	y_new = y + _y;
	speed_const = _speed;
}

move_to = function(_x, _y, _speed) {
	is_moving = true;
	x_new = _x;
	y_new = _y;
	speed_const = _speed;
}

skip_moving = function() {
	is_moving = false;
	x = x_new;
	y = y_new;
	speed_const = 0;
}

speak = function() {
	image_speed = 1;
}

stop_speaking = function() {
	image_index = 0;
	image_speed = 0;
}

change_sprite_to_other_sprite = function(previous_sprite, new_sprite) {
	if (sprite_index == previous_sprite)
		sprite_index = new_sprite;
}