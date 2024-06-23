
if (destroy) {
	if (image_alpha <= 0) {
		image_alpha += 0.5;	
	}
	else {
		instance_destroy();	
	};
};