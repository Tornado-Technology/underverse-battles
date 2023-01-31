time++;

if (time <= fly_time) {
	x = lerp(x, x_new, 0.1);
	y = lerp(y, y_new, 0.1);
}

if (time <= charge_time - 6) {
	if (instance_exists(target))
		image_angle = point_direction(x, y, target.x, target.y) + 90;
}

if (time == fly_time) {
	sprite_index = charge_sprite;
	instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_charge);
	audio_play_sound_plugging(snd_gb_charge2);
}

if (time == charge_time) {
	sprite_index = shot_sprite;
	instance_destroy(obj_charge);
	blast = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_blast);
	blast._angle = image_angle - 90;
	if (!is_shaked) {
		effect_shake(2, 0.3);
	}
	audio_play_sound_plugging(snd_gb_shot);
}

if (time > shoot_time) {
	sprite_index = idle_sprite;
	time = 0;
}
