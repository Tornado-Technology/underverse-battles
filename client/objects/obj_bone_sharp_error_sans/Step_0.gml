event_inherited();

if (is_falling) {
	if (speed_const < speed_max)
	speed_const += acceleration;
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
	platform = instance_place(x, y, obj_platform);
	hspd_inert = platform.const_speed;
	
	var depth_stuck = 20;
	if (is_falling) {
		if (image_angle == 0 && platform.y > y - depth_stuck ||
			image_angle == 180 && platform.y < y + depth_stuck) {
			audio_play_sound_plugging(snd_projectile_hit);
			speed_const = 0;
			is_falling = false;
		}
	}
}

x += hspd_inert * dtime;