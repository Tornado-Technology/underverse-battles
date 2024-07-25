if (is_destroing) {
	if (image_alpha <= 0) {
		image_alpha += 0.5;	
	} else {
		instance_destroy();	
	};
};



if (stage == 0 && image_yscale < max_yscale) {
	image_yscale += 0.2 * dtime;
} else if (stage == 0) {
	stage = 1;
};

if (stage == 1 && image_alpha > 0) {
	image_yscale -= 0.2 * dtime;
	image_alpha -= 0.1 * dtime;
} else if (stage == 1) {
	instance_destroy();
};