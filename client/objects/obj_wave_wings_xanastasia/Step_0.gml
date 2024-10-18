if (image_alpha < max_alpha && !disappearance) {
	image_alpha += step * dtime;	
} else if (image_alpha > 0 && disappearance) {
	image_alpha -= step * dtime;
}

if (image_alpha <= 0 && disappearance) {
	instance_destroy();
}

motion_set(image_angle, speed_const * dtime);


