if(!stop_alpha)
	if (alpha < 1) {
		alpha += step_alpha * dtime;
}

image_alpha = alpha;


if (is_spining) {
	image_angle += speed_angle * dtime;
}


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
	image_angle = lerp(image_angle, target_, speed_const * dtime);
	x += dcos(target_);
	y += dsin(target_);
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