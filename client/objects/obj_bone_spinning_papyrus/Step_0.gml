image_angle = (image_angle + 5 * dtime) % 360;
motion_set(direction, speed_const * dtime);

if (scale_time > 0) {
	image_xscale = approach(image_xscale, scale_const, scale_time * dtime);	
}
