if (image_alpha < 1)
	image_alpha += 0.05;
	
if (is_spining) {
	image_angle += speed_angle * dtime;
	
	if (step == 2) {
		if (x > _border.x + _border.right + 20) {
			point_stop_x = _border.x - _border.left - 20;
			direction = 180;
		}
		else {
			point_stop_x = _border.x + _border.right + 20;
			direction = 0;
		}
		step = 0;
		audio_play_sound_once(snd_projectile);
	}
}
	
if (is_moving) {
	if (step == 0 && speed < speed_max) { // Набирание скорости
		speed += speed_const / 2 * dtime;
	}
	else if (step == 0) { // Движение
		step = 1;
		speed = speed_max;
	}
	else if ((direction == 0 && x > point_stop_x || direction == 180 && x < point_stop_x) && step == 1) { // Остановка
		if (speed > 0)
			speed -= speed_const * dtime;
		else {
			step = 2;
		}
	}
	else if ((direction == 270 && y > point_stop_y || direction == 90 && y < point_stop_y) && step == 1) { // Остановка
		if (speed > 0)
			speed -= speed_const * dtime;
		else {
			step = 2;
		}
	}
}

if (is_moving_up) {
	if (step == 0 && y < _border.y - _border.up - 20)
		x = approach(x, _soul.x, 1);
	if (step == 2) {
		if (y > _border.y + _border.down - 10) {
			point_stop_y = _border.y - _border.up - 20;
			direction = 90;
		}
		else {
			point_stop_y = _border.y + _border.down - 10;
			direction = 270;
			audio_play_sound_once(snd_projectile);
		}
		step = 0;
	}
}