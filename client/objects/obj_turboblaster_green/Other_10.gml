/// @description Time sources
time_source_flying = time_source_create(time_source_game, fly_time, time_source_units_seconds, function () {
	sprite_index = charge_sprite;
	instance_create_depth(x, y, fight_depth.bullet_outside_hight, charge_object);
	audio_play_sound_plugging(snd_gb_charge2);
	time_source_start(time_source_charging);
	time_source_start(time_source_target);
});

time_source_charging = time_source_create(time_source_game, charge_time, time_source_units_seconds, function () {
	sprite_index = shot_sprite;
	instance_destroy(charge_object);
	blast = instance_create_depth(x, y, fight_depth.bullet_outside_hight, blast_object);
	blast._angle = image_angle - 90;
	if (!is_shaked) {
		is_shaked = true;
		effect_shake(2, 0.3);
	}
	audio_play_sound_plugging(snd_gb_shot);
	time_source_start(time_source_destroying);
});

time_source_target = time_source_create(time_source_game, target_time, time_source_units_seconds, function () {});

time_source_destroying = time_source_create(time_source_game, destroy_time, time_source_units_seconds, function () {
	sprite_index = idle_sprite;
	is_shaked = false;
	time_source_start(time_source_flying);
});