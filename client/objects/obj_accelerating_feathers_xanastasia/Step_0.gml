
if (image_alpha < 1)
	image_alpha += alpha_step * dtime;

motion_set(image_angle, _speed * dtime);
	