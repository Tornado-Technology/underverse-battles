if(!stop_alpha)
	if (alpha < 1) {
		alpha += step_alpha * dtime;
}

image_alpha = alpha;
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

if (is_target) {
	image_angle = lerp(image_angle, target_, speed_const * dtime);
	x += dcos(target_);
}

if (is_trap) {
	motion_set(direction, speed_const * dtime);
	time_source_start(time_source_destroy_blades);
};

if (is_swung) {
	if (stage == 1) {
		if (max_acc > acc) acc += dtime;
		 image_angle += acc * angle_speed_const * dtime;
	}

	if (stage == 2) {
		if (acc > 0) acc -= dtime;
		 image_angle += acc * angle_speed_const * dtime;
	}

	if (stage == 1 || stage == 2) {
		if (side == 0) {
			x += speed_const * dtime;
		}
		else if (side == 1) {
			y += speed_const * dtime;
		}
		else if (side == 2) {
			x -= speed_const * dtime;
		}
		else if (side == 3) {
			y -= speed_const * dtime;
		}
	}
}

if (stop_alpha) {
	alpha -= step_alpha * dtime;
	if (alpha <= 0) {
		instance_destroy();
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