x = approach(x, position_target_x, speed_const * dtime);


if(destroy) {
image_alpha -= 0.1 * dtime;
	if(image_alpha <= 0) {
		instance_destroy();	
	};
} else {
	if(x == position_target_x) {
		spwan();	
	};	
};