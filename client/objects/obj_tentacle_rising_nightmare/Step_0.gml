if (scale_time > 0) {
	image_xscale = approach(image_xscale, scale_const,  scale_time * dtime);
}

if (attack) {
	if (image_xscale >= scale_const) {
		scale_const = start_scale;	
		back--;
	}


	if (image_xscale <= start_scale) {
		scale_const = new_counst;
	}

}