if (image_alpha < 1)
	image_alpha += 0.05 * dtime;
	
if (is_spining) {
	image_angle += speed_angle * dtime;
	
	if (step == 2) {
		if (x > obj_battle_border.x + obj_battle_border.right + 20) {
			point_stop_x = obj_battle_border.x - obj_battle_border.left - 20;
			direction = 180;
		}
		else {
			point_stop_x = obj_battle_border.x + obj_battle_border.right + 20;
			direction = 0;
		}
		step = 0;
		audio_play_sound_once(snd_projectile);
	}
}
	
if (is_moving) {
	if (step == 0 && speed < speed_max) { // Speed up
		speed += speed_const / 2 * dtime;
	}
	else if (step == 0) { // Movement
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
	if (step == 0 && y < obj_battle_border.y - obj_battle_border.up - 20)
		x = approach(x, obj_battle_soul.x, 1);
	if (step == 2) {
		if (y > obj_battle_border.y + obj_battle_border.down - 10) {
			point_stop_y = obj_battle_border.y - obj_battle_border.up - 20;
			direction = 90;
		}
		else {
			point_stop_y = obj_battle_border.y + obj_battle_border.down - 10;
			direction = 270;
			audio_play_sound_once(snd_projectile);
		}
		step = 0;
	}
}