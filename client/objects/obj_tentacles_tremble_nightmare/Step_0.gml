if (scale_time > 0) {
	image_xscale = lerp(image_xscale, scale_const, scale_time * dtime);
}

motion_set(direction, speed_coust * dtime);