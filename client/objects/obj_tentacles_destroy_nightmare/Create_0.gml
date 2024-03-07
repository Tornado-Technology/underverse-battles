event_inherited();
time_destroy = 10;


time_source_destroy_tentacles = time_source_create(time_source_game, time_destroy / 60, time_source_units_seconds, function () {
	instance_destroy();
});

