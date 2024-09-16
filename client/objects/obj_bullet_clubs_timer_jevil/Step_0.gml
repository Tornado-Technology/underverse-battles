image_index = 0;

if (image_alpha <= 1) {
	image_alpha += 0.05;	
}

if (attack) {
	image_blend = c_white;
	motion_set(image_angle, speed_count * dtime);
} else {
	image_blend = c_gray;
	x = center_x + dcos(angle) * radius;
	y = center_y + -dsin(angle) * radius;
}


if time_source_get_state(time_source_start_attack) == time_source_state_stopped {
	if(radius <= radius_max + 10 && !attack) {
		radius = lerp(radius, radius_max + 20, length_charge * dtime);		
	}
	if (radius >= radius_max + 10) {
		attack = true;
	}
}