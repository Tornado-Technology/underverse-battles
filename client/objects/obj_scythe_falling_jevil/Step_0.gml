if (image_alpha < 1) {
	image_alpha += 0.05 * dtime;
}

image_angle += -dsin(4) * sprite_height;

motion_set(angle, speed_count * dtime);