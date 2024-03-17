direction = image_angle;
motion_set(direction, speed_count * dtime);

if (destroy) {
	image_alpha -= 0.1;
	instance_destroy();	
}


