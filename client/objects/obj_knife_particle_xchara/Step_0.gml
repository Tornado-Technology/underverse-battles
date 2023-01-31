image_alpha = approach(image_alpha, 0, alpha_step);

if (image_alpha <= 0)
	instance_destroy();