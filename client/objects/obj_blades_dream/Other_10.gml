/// @description Move
var battle_instance = obj_battle_border;

if (is_spining) {
	image_angle += speed_angle * dtime;
	
	if (step == 2) {
		if (x > battle_instance.x + battle_instance.right + 20) {
			point_stop_x = battle_instance.x - battle_instance.left - 20;
			direction = 180;
		}
		else {
			point_stop_x = battle_instance.x + battle_instance.right + 20;
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
	if (step == 0 && y < battle_instance.y - battle_instance.up - 20) {	
		x = approach(x, obj_battle_soul.x, 1);	
	}
	
	if (step == 2) {	
		if (y > battle_instance.y + battle_instance.down - 10) {
			point_stop_y = battle_instance.y - battle_instance.up - 20;
			direction = 90;
		}
		else {
			point_stop_y = battle_instance.y + battle_instance.down - 10;
			direction = 270;
			audio_play_sound_once(snd_projectile);		
		}
		step = 0;
	}
}

if (is_moving_left) {
	if (step == 0 && x < battle_instance.x - battle_instance.left - 20) {
		x = approach(x, obj_battle_soul.x, 1);
		y = approach(y, obj_battle_soul.y, 2);	
	}
	
	if (step == 2) {
		if (x > battle_instance.x + battle_instance.right + 10) {
			point_stop_x = battle_instance.x - battle_instance.left - 10;
			direction = 180;
		}
		else {
			point_stop_x = battle_instance.x + battle_instance.right + 10;	
			direction = 0;
			audio_play_sound_once(snd_projectile);
		}
		step = 0;
	}
}


if (is_moving_line) {

	if (step == 0 && x < battle_instance.x - battle_instance.left - 20) {
		stop_alpha = true;
	}
	
	if (step == 2) {
		if (direction == 0 && image_angle == 180 && x > point_stop_x) {
			point_stop_y = battle_instance.y + battle_instance.down;
			point_stop_x = battle_instance.x - battle_instance.left;
			direction = 270;
		}
		else if (direction == 180 && image_angle == 180 && x < point_stop_x) {
			point_stop_y = battle_instance.y - battle_instance.up;
			point_stop_x = battle_instance.x + battle_instance.right;
			direction = 90;
			audio_play_sound_once(snd_projectile);
		}
		if (direction == 0 && image_angle == 90 && x > point_stop_x) {
			point_stop_y = battle_instance.y + battle_instance.down;
			direction = 270;
		}
		else if (direction == 180 && image_angle == -90 && x < point_stop_x) {
			point_stop_x = battle_instance.x + battle_instance.right;
			direction = 180;
			audio_play_sound_once(snd_projectile);
		}
	step = 0;
	}
}

















