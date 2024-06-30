if (image_angle == 360)
	image_angle = 0;
image_angle += -dsin(4) * sprite_height;


motion_set(angle, speed_count * dtime)