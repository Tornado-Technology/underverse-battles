/// @description Time source
time_source_target = time_source_create(time_source_game, target_time, time_source_units_seconds, function () {	
	time_source_start(time_source_shot);
	sprite_index = charge_sprite;

});

time_source_shot = time_source_create(time_source_game, shot_time, time_source_units_seconds, function () {
	sprite_index = shot_sprite;
	if (!instance_exists(arrows_instance)) exit;
	arrows_instance.move = true;	
	time_source_start(time_source_bow_destroy);
});

time_source_bow_destroy = time_source_create(time_source_game, destroy_time, time_source_units_seconds, function () {
	stop_alpha = true;	
	index = 4;
	image_alpha -= step * dtime;
	instance_destroy();	
});

