event_inherited();
time_destroy = 10;
speed_angle = 1;

time_source_destroy_tentacles = time_source_create(time_source_game, time_destroy / 60, time_source_units_seconds, function () {
	instance_destroy();
});

time_source_start(time_source_destroy_tentacles);

changes_angle = false;