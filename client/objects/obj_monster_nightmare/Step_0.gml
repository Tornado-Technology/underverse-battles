
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

if (!hand_down) {
	 i = 0;
	repeat(2) {
		if(i > 1) i = 0;
		fist[i].x = x + (70 * i) + dcos(angle) * radius;
		fist[i].y = y + dsin(angle) * radius;	
		fist[i].image_xscale = image_xscale;
		i++;
	}
} else {
	var up = obj_battle_border.y - obj_battle_border.up + 10;
	var down = obj_battle_border.y + obj_battle_border.down - 10;
	var num_fist_attack = i > 0 ? 0 : 1;
	var bone_old = fist[num_fist_attack];

	
	
	fist[i].x = x + (100 * i) + dcos(angle) * radius;
	fist[i].y = y - (5 * i) + dsin(angle) * radius;
	
	fist[num_fist_attack].smooth_y(fight_random_integer(up, down));
	
	fist[num_fist_attack] =	instance_create_depth(bone_old.x, bone_old.y, bone_old.depth, obj_fist_nightmare, {
		speed_count: speed_count,
		image_xscale: image_xscale,
		disable_surface: true
	});
	
	fist[num_fist_attack].direction = angle_fist;
	fist[num_fist_attack].depth = bone_old.depth;
	fist[num_fist_attack].step = step;
	
	hand_down = false;
	fist_attack = false;

	time_source_start(time_source_attack_timer);
}

angle += speed_count * dtime;