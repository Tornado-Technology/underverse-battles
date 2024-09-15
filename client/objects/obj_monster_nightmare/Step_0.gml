
if(image_alpha <= 1) {
	image_alpha += step * dtime;	
}

if(!start_attack_fist) {
	x = approach(x, position_head_x, speed_count * dtime);
	y = approach(y, position_head_y, speed_count * dtime);
	
	if (x == position_head_x && y == position_head_y) {
		time_source_start(time_source_attack);
		time_source_start(time_source_hand_donw);
		
		start_attack_fist = true;	
	}
}

x = approach(x, position, 1 * dtime);

fist_instance[0].x = x + dcos(angle) * radius;
fist_instance[0].y = y + dsin(angle) * radius;	
fist_instance[0].image_xscale = image_xscale;

fist_instance[1].x = x + (70) + dcos(angle) * radius;
fist_instance[1].y = y + dsin(angle) * radius;	
fist_instance[1].image_xscale = image_xscale;


angle += speed_count * dtime;