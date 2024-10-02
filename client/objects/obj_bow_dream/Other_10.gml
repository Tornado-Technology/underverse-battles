/// @description Time source
time_source_target = time_source_create(time_source_game, target_time, time_source_units_seconds, function() {	
	time_source_start(time_source_shot);
});

time_source_shot = time_source_create(time_source_game, shot_time, time_source_units_seconds, function() {
	sprite_index = shot_sprite;
	if (!instance_exists(arrow_instance)) exit;
	arrow_instance.move = true;	
	time_source_start(time_source_bow_destroy);
	
	audio_play_sound_plugging(snd_bow_shot);
});

time_source_bow_destroy = time_source_create(time_source_game, destroy_time, time_source_units_seconds, function() {	
	sprite_index = idle_sprite;
	
	sprite_fram = 4;
	destroying = true; 	
});

