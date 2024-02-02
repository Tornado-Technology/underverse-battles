event_inherited();

time_source_scale = time_source_create(time_source_game, scale_delay, time_source_units_seconds, function () {
	change_scale(blue_attack_scale, 0.2);
	audio_play_sound_plugging(snd_spare_up);
});

time_source_start(time_source_scale);