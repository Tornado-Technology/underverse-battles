
image_angle += (speed_spinning * dtime) % 360;
motion_set(direction, speed_const * dtime);



if (scale_time > 0) {
	image_yscale = approach(image_yscale, scale_const, scale_time * dtime);	
};

