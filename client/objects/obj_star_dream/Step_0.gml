if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += 0.1;	
	};	
};

image_angle -= speed_const * dtime;
motion_set(direction, speed_const * dtime);	
