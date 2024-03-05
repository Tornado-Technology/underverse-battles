if (stage == 0) {
	if (image_alpha < 1)
		image_alpha += 0.05 * dtime;
}

if (stage == 1) {
	ink_x = cos(degtorad(image_angle - 180))*60;
	ink_y = -sin(degtorad(image_angle - 180))*60;
	instance_create_depth(x + ink_x + fight_random_integer(-2, 2), y + ink_y + fight_random_integer(-3, 3), fight_depth.bullet_outside, obj_ink_curcle_ink_sans);
	if (max_acc > acc) acc += dtime;
	image_angle += acc * angle_speed_const * dtime;
}

if (stage == 2) {
	ink_x = cos(degtorad(image_angle - 180))*60;
	ink_y = -sin(degtorad(image_angle - 180))*60;
	instance_create_depth(x + ink_x + fight_random_integer(-2, 2), y + ink_y + fight_random_integer(-3, 3), fight_depth.bullet_outside, obj_ink_curcle_ink_sans);
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

if (stage == 3) {
	if (image_alpha > 0)
		image_alpha -= 0.05 * dtime;
	else
		instance_destroy();
}