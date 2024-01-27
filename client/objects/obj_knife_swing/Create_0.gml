image_xscale = scale / sprite_width;

time_source = time_source_create(time_source_game, 1/3, time_source_units_seconds, function () {
	instance_destroy();
});
time_source_start(time_source);

audio_play_sound_plugging(snd_stab);