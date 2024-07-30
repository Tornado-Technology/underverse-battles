if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += 0.1;	
	};	
};

image_angle += speed_const * dtime;

x = xstart + -dcos(y) * 80;
y += speed_const * dtime; 