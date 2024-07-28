if (!destroying) {
	if (image_alpha < 1) {
		image_alpha += step_alpha * dtime;
	};
} else {
	image_alpha -= step_alpha * dtime;
	if(image_alpha <= 0) {
		instance_destroy();	
	};
};



image_index =  lerp(image_index, sprite_fram, step * dtime);	
