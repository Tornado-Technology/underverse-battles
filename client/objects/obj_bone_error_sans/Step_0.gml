event_inherited();

if (is_falling) {
	if (obj_battle_border.y + obj_battle_border.down - 10) {
		hspd += acceleration;
		y = hspd * dtime;
	}
	else {
		audio_play_sound_plugging(snd_projectile_hit);
		is_falling = false;
	}
}

if (place_meeting(x, y, obj_platform)) {
	platform = instance_place(x, y, obj_platform);
	hspd_inert = platform._speed;
	if (image_angle == 0)
		if (platform.y > y - 20)
			can_move = false;
	if (image_angle == 180)
		if (platform.y < y + 20)
			can_move = false;
}

x += hspd_inert;