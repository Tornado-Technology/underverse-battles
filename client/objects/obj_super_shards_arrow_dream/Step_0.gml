image_index = sprite_fram;


speed_fall += step;

y += speed_fall * dtime;
motion_set(direction, speed_const * dtime);	
	