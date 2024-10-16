if (stage == 0) {
	if (image_alpha < 1)
		image_alpha += 0.05 * dtime;
}

if (stage == 1) {
	if (max_acc > acc) acc += dtime;
	image_angle += acc * angle_speed_const * dtime;
	
	if (!is_drawing) {
		time_source_start(time_source_ink_curcle);
		is_drawing = true;
	}
}

if (stage == 2) {
	if (acc > 0) acc -= dtime;
	image_angle += acc * angle_speed_const * dtime;
}

if (stage == 3) {
	time_source_stop(time_source_ink_curcle);
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

if (stage == 3) {
	if (image_alpha > 0)
		image_alpha -= 0.1 * dtime;
	else
		instance_destroy();
}