event_inherited();

if (is_falling) {
	if (y < obj_battle_border.y + obj_battle_border.down - 10) {
		hspd += acceleration;
		speed_const = hspd;
	}
	else {
		audio_play_sound_plugging(snd_projectile_hit);
		is_falling = false;
	}
}

if (is_moving_back) {
	if (x > obj_battle_border.x - obj_battle_border.left && x < obj_battle_border.x + obj_battle_border.right && y > obj_battle_border.y - obj_battle_border.up && y < obj_battle_border.y + obj_battle_border.down) {
		speed_const = 0;
		time_source_start(time_source_move_back);
	}
}

if (place_meeting(x, y, obj_platform)) {
	platform = instance_place(x, y, obj_platform);
	hspd_inert = platform.const_speed;
	if (image_angle == 0)
		if (platform.y > y - 20)
			can_move = false;
	if (image_angle == 180)
		if (platform.y < y + 20)
			can_move = false;
}

x += hspd_inert;