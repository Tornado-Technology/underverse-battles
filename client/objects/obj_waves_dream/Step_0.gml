if (!stop_alpha) {
	if (image_alpha < 1) {
		image_alpha += 0.04;	
	}
	

}



	//motion_set(_dir, speed_const * dtime);

if (stop_alpha) {
	image_alpha -= 0.03;	
	if (image_alpha <= 0) 
		instance_destroy();
}


image_angle = _dir + 80;


