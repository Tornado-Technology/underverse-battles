if (image_alpha <= 1) {
	image_alpha += 0.1;
	if (image_alpha >= 0.4) {
		exit;	
	}
}

motion_set(direction,  speed_const * dtime);

if (destroying) {
	image_xscale = approach(image_xscale, 0, 0.03 * dtime);
	image_yscale -= 0.03 * dtime;	
	
	if(image_yscale == 0) {
		instance_destroy();	
	};
};