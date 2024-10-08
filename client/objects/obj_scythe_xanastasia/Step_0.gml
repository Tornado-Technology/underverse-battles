if(image_alpha <= 1) {
	image_alpha += 0.03 * dtime;	
}

image_angle += rotation_speed_const * dtime;

if (come_back) {
	var moving_come_back = point_direction(x, y, xstart, ystart);
	if (image_alpha >= 0.8) {
		if (!move_come_back) {
			x = approach(x, position_x, speed_count * dtime);
			y = approach(y, position_y, speed_count * dtime);
		
				if(x == position_x && y == position_y) {
					move_come_back = true;		
				}
			
			} else {
			motion_set(moving_come_back, speed_count * dtime);
			come_back = false;
		}
	}
	exit;
}

if (moves_ends_arena) {
	if (image_alpha >= 1) {
		x = start_x + dcos(angle) * radius; 
		angle += 2 + (speed_count * 0.01) * dtime;
	}
	exit;
}

speed = speed_count * dtime;