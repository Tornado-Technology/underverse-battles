time++;

if (time <= fly_time) {
	x = lerp(x, x_dir, 0.1);
	y = lerp(y, y_dir, 0.1);
}

if (time == fly_time) {
	sprite_index = charge_sprite;
	instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_charge);
	audio_play_sound_plugging(snd_gb_charge1);
}

if (time == charge_time) {
	sprite_index = shot_sprite;
	instance_destroy(obj_charge);
	blast = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_blast);
	blast._angle = image_angle - 90;
	if (!is_shaked) {
		is_shaked = true;
		effect_shake(2, 0.3);
	}
	audio_play_sound_plugging(snd_gb_shot);
}

if (time > charge_time) {
	x = lerp(x, xstart, 0.1);
	y = lerp(y, ystart, 0.1);
	if (instance_exists(blast)) {
		blast.x = x;
		blast.y = y;
	}
}

if (time > charge_time + 15) {
	image_alpha -= 0.1;
}

if (image_alpha <= 0) {
	instance_destroy();
}