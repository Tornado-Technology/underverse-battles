if(!stop_alpha)
	if (alpha < 1) {
		alpha += step_alpha * dtime;
}

image_alpha = alpha;

if (is_target) {
	image_angle = lerp(image_angle, target_, speed_const * dtime);
	x += dcos(target_);
}

if (is_trap) {
	motion_set(direction, speed_const * dtime);
	time_source_start(time_source_destroy_blades);
};

if (is_swung) {
	if (stage == 1) {
		if (max_acc > acc) acc += dtime;
		 image_angle += acc * angle_speed_const * dtime;
		 if (is_waves) {	
		var angle_offset = image_angle - 180;
		var radius = sprite_width;
		var	waves_x = dcos(angle_offset);
		var	waves_y = -dsin(angle_offset);
		var waver = instance_create_depth(x + waves_x , y + waves_y , fight_depth.bullet_outside, obj_waves_dream, {
		image_angle : image_angle * radius
		});
			waver.speed_const  = speed_const; 
			waver._dir =  point_direction(waver.x, waver.y, obj_battle_soul.x, obj_battle_soul.y);
			is_waves = false;
		}
	}

	if (stage == 2) {
		if (acc > 0) acc -= dtime;
		 image_angle += acc * angle_speed_const * dtime;
	}

	if (stage == 1 || stage == 2) {
		if (side == 0) {
			x += speed_const * dtime;
		}
		else if (side == 1) {
			y += speed_const * dtime;
		}
		else if (side == 2) {
			x -= speed_const * dtime;
		}
		else if (side == 3) {
			y -= speed_const * dtime;
		}
	}
	
	
	
}

if (stop_alpha) {
	alpha -= step_alpha * dtime;
	if (alpha <= 0) {
		instance_destroy();
	}	
}


event_user(0);
