if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += step * dtime;	
	}
	
	if (image_alpha >= 1) {
		gradually_alpha = false;	
	}
}

if (circle_moving) {
	spinnig_speed = approach(spinnig_speed, speed_count, step * dtime);

	if (stage == 0) {
		radius -= spinnig_speed * dtime;
		
		if (radius <= 15) {
			stage = 1;	
		}
	} else {
		radius += spinnig_speed * dtime;
	
		if(radius >= radius_max) {
			stage = 0;	
		}
	}

	x = center_x + dcos(angle) * radius;
	y = center_y - dsin(angle) * radius;	
	angle += spinnig_speed * dtime; 
	image_angle = angle + 180;
}

if (destroying) {
	image_alpha -= step - 0.01 * dtime;
	if(image_alpha <= 0) {
		instance_destroy();	
	}
}

if (target_posititon) {
	x = approach(x, position_x, speed_count  * dtime);
	y = approach(y, position_y, speed_count * dtime);
	
	if (x == position_x && y == position_y) {
		time_source_start(time_source_attack);
		target_posititon = false;
	}
}

if (aim_soul) {
	if (image_alpha >= 1) {
		x = approach(x, position_x, speed_count * dtime);
		y = approach(y, position_y, speed_count * dtime);
	}

	if (is_desrtoying && x == position_x && y == position_y) {
		time_source_start(time_source_self_destroying);	
		is_desrtoying = false;
	}
}
	