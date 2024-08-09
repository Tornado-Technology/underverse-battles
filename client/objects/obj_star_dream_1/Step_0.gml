if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += 0.1;	
	};	
};

angle += 1 + speed_const * dtime;
image_angle = angle;
motion_set(direction, speed_const * dtime);

x = xstart + (dcos(angle) + dcos(angle + 30)) * 10;