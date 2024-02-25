event_inherited();

time_source_destroy_tentacles = time_source_create(time_source_game, 10 / 60, time_source_units_seconds, function () {
	instance_destroy();
});

time_source_start(time_source_destroy_tentacles);