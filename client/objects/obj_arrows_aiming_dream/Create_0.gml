event_inherited();

// Time  sources
time_source_target = time_source_create(time_source_game, target_time, time_source_units_seconds, function() {
});

time_source_mover = time_source_create(time_source_game, mover_time, time_source_units_seconds, function() {	
	shot = true;
	direction = image_angle; 
	speed = speed_cont * dtime;
});

shot = false;