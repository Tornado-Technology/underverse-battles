event_inherited();

if (is_falling) {
	if (speed_const < speed_max)
	speed_const += acceleration * dtime;
}

if (is_moving_back) {
	if (x > obj_battle_border.x - obj_battle_border.left && x < obj_battle_border.x + obj_battle_border.right && y > obj_battle_border.y - obj_battle_border.up && y < obj_battle_border.y + obj_battle_border.down) {
		speed_const = 0;
		time_source_start(time_source_move_back);
	}
}

if (can_stuck) {
	if (y > obj_battle_border.y + obj_battle_border.down - 5) {
		if (speed_const != 0) {
			speed_const = 0;
			is_falling = false;
			can_stuck = false;
			audio_play_sound_plugging(snd_projectile_hit);
		}
	}
}

if (place_meeting(x, y, obj_platform)) {
	var platform_instance = instance_place(x, y, obj_platform);
	hspd_inert = platform_instance.const_speed;
	
	var depth_stuck = 10 * image_yscale;
	if (is_falling) {
		if (direction == 0 && platform_instance.x > x - depth_stuck ||
			direction == 180 && platform_instance.x < x + depth_stuck ||
			direction == 90 && platform_instance.y > y - depth_stuck ||
			direction == 270 && platform_instance.y < y + depth_stuck) {
			audio_play_sound_plugging(snd_projectile_hit);
			speed_const = 0;
			is_falling = false;
		}
	}
}

x += hspd_inert * dtime;