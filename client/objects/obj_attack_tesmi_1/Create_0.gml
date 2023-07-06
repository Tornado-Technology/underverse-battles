event_inherited();

period = 0.5
count_repeats = 4;

time_source_instance_destroy = time_source_create(time_source_game, 15, time_source_units_seconds, function() {
	instance_destroy(id);
	instance_destroy(pattern);
});

callback = function() {
	pattern = create_pattern(obj_pattern_line_curve_fireball)
	pattern.time_to_start_attack = 1;
	pattern.angle_offset = 65;
}
	
time_source_start(time_source_instance_destroy);
