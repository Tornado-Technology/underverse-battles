if (image_alpha < 1) {
	image_alpha += 0.06 * dtime;
	exit;
}

image_angle += -dsin(4) * (sprite_height * dtime);
	
if (moving) {
	time_before_attack -= 1 * dtime;
	
	if (time_before_attack <= 0) {
		attack = true;
		moving = false;
	}
}

if(attack && !is_bomb) {
	sides_scythe = x > obj_battle_border.x ? 1 : -1;
		
	if (!backwards) {
		x = approach(x, position_x, speed_count * dtime);
		
		if (point_distance(x, y, position_x, y) <= 10) {		
			vspeed = moving_y * dtime;	
			backwards = true;
			backwards_count--;
		}
	} else { 
		x = approach(x, xstart, speed_count * dtime);	
		
		if(x == xstart) {
			backwards = false;
		}
	}
}

if (backwards_count <= 0 && attack) {
	attack = false;
	is_bomb = true;
	spwan_diamonds();	
	vspeed = 0;
}

if (is_bomb) {
	alpha = approach(alpha, 0, alpha_time * dtime);
	radius += 2 * dtime;
	
	if (alpha == 0) {
		instance_destroy();
	}
}