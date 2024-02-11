/// @description Time sources
time_source_flying = time_source_create(time_source_game, fly_time, time_source_units_seconds, function () {
	sprite_index = charge_sprite;
	if (charge_object != noone) {
		charge_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, charge_object);
	}
	audio_play_sound_plugging(charge_sound);
	time_source_start(time_source_charging);
});

time_source_charging = time_source_create(time_source_game, charge_time, time_source_units_seconds, function () {
	sprite_index = shot_sprite;
	instance_destroy(charge_instance);
	blast_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, blast_object);
	blast_instance._angle = image_angle - 90;
	if (!is_shaked) {
		is_shaked = true;
		effect_shake(2, 0.3);
	}
	audio_play_sound_plugging(shot_sound);
	time_source_start(time_source_flying_out);
});

time_source_flying_out = time_source_create(time_source_game, flyout_time, time_source_units_seconds, function () {
	time_source_start(time_source_destroying);
});

time_source_destroying = time_source_create(time_source_game, destroy_time, time_source_units_seconds, function () {
	instance_destroy();
});