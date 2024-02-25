image_xscale = lerp(image_xscale, scale_const, (back ? back_time : scale_time) * dtime);

if (image_xscale >= scale_const) {
	scale_const = end_counst;	
	scale_time  = end_time;
	back = false;
}

if (image_xscale <= end_counst) {
	scale_const = new_counst;
	back = true;
}