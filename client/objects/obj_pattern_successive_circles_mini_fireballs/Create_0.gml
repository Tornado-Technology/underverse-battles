// Arguments: fireball

period = 0.5
count_repeats = 4;

time_source_create_pattern = time_source_create(time_source_game, period, time_source_units_seconds, function() {
	if (!instance_exists(soul_instance)) return;
	
	var pattern = create_pattern(obj_patern_circle_fireballs);
	pattern.time_to_start_attack = 1;
	pattern.angle_offset = 65;
	
}, [], count_repeats);


time_source_enable_pattern = time_source_create(time_source_game, 3, time_source_units_seconds, function() {
	if (!instance_exists(soul_instance)) return; 
	
	time_source_start(time_source_create_pattern);
}, [], -1);

time_source_start(time_source_enable_pattern);
time_source_start(time_source_create_pattern);