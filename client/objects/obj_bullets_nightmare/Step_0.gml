if (image_alpha <= 1) {
	image_alpha += 0.05 * dtime;		
};

image_angle = direction + 90; 
motion_set(direction, speed_const * dtime);