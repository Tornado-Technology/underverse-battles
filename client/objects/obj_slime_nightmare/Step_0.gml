image_yscale = approach(image_yscale, back ? back_const : scale_const, scale_time * dtime);

if  (image_yscale >= scale_const) {
	back = true;	
}
else if (image_yscale <= back_const) {
	back = false;	
}