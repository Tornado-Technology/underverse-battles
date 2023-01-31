image_angle = _target_angle;

if (image_alpha < 1)
	image_alpha += alpha_step;

motion_set(image_angle, _speed);