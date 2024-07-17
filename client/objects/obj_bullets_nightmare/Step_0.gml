if (image_alpha <= 1) {
	image_alpha += 0.05 * dtime;		
};
image_angle = direction - 180;
motion_set(direction, speed_const * dtime);