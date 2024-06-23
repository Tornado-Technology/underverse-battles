event_inherited();

if (destroy) {
	touching_walls = false;
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();
	};	
}
