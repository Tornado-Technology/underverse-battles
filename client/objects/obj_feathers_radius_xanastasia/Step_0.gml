if (destroying) {
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();	
	}
} else {
	if (image_alpha <= 1) {
		image_alpha += 0.05;
	}
}

if (moving_radius) {
	if(!is_versa) {
		x = center_x + dcos(angle) * radius;
		y = center_y + -dsin(angle) * radius;
	} else {
		x = center_x - dcos(angle) * radius;
		y = center_y - dsin(angle) * radius;
	}
	
	angle += rotating_speed_count * dtime;
	image_angle = point_direction(x, y, center_x, center_y);	
}

impact_on_radius();







