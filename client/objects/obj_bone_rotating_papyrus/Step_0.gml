event_inherited();

if (scale_time > 0) {
	image_xscale = approach(image_xscale, scale_const, scale_time * dtime);	
}
