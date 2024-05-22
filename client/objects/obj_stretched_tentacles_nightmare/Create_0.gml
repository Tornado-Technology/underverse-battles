event_inherited();

scale_time = 0.4;

scale_original = image_yscale;
speed_count_original = speed_count;

scale_const_max = 10;

shot = false;

time_source_state = time_source_create(time_source_game, time_state / 60, time_source_units_seconds, function () {
	speed_count = 0;
});

time_source_return_state = time_source_create(time_source_game, time_return / 60, time_source_units_seconds, function () {
	speed_count = speed_count_original;
	scale_const = scale_original;
});
