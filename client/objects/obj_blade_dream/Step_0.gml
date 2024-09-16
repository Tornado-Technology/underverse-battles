if(!stop_alpha) {
	if (alpha < 1) {
		alpha += step_alpha * dtime;
	}
}

image_alpha = alpha;

if (is_moving) {
	if (step == 0 && speed < speed_max) { // Speed up
		speed += speed_const / 2 * dtime;
	}
	else if (step == 0) { // Movement
		step = 1;
		speed = speed_max;
	}
	else if ((direction == 0 && x > point_stop_x || direction == 180 && x < point_stop_x) && step == 1) { // Stop
		if (speed > 0)
			speed -= speed_const * dtime;
		else {
			move_back();
		}
	}
	else if ((direction == 270 && y > point_stop_y || direction == 90 && y < point_stop_y) && step == 1) { // Stop
		if (speed > 0)
			speed -= speed_const * dtime;
		else {
			move_back();
		}
	}
}

if (is_target) {
	image_angle = on_target;
	
	if (step == 0) {
		x = approach(x, obj_battle_soul.x,  speed_const * dtime);
		y = approach(y, obj_battle_soul.y,  speed_const * dtime);
	}
}



if (is_directions) {
	motion_set(direction, speed_const * dtime);
	time_source_start(time_source_destroy_blades);
};

if (is_swung) {
	if (stage == 1) {
		if (max_rotate_acceleration > rotate_acceleration) rotate_acceleration += dtime;
		if (max_acceleration > acceleration) acceleration += dtime;
		image_angle += rotate_acceleration * angle_speed_const * dtime;
	}

	if (stage == 2) {
		if (rotate_acceleration > 0) rotate_acceleration -= dtime;
		if (acceleration > 0) acceleration -= 0.1 * dtime;
		image_angle += rotate_acceleration * angle_speed_const * dtime;
	}

	if (stage == 1 || stage == 2) {
		if (side == 0) {
			x += acceleration * dtime;
		}
		else if (side == 1) {
			y += acceleration * dtime;
		}
		else if (side == 2) {
			x -= acceleration * dtime;
		}
		else if (side == 3) {
			y -= acceleration * dtime;
		}
	}
};

if (is_spinning) {
	image_angle += speed_spinning * dtime;	
};

if (stop_alpha) {
	alpha -= step_alpha * dtime;
	if (alpha <= 0.2) {
		instance_destroy();
	};	
};