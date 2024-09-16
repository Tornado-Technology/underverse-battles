if (!destroying) {
	if (image_alpha < 1) {
		image_alpha += step_alpha * dtime;
	}
} else {
	image_alpha -= step_alpha * dtime;
	if (image_alpha <= 0) {
		instance_destroy();	
	}
}

sprite_fram =  approach(sprite_fram, sprite_get_number(sprite_index) - 1, step * dtime);	

image_index = sprite_fram;