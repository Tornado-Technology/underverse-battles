event_inherited();

timer_destroy = 10;

time_source_destroy_tentacles = time_source_create(time_source_game, timer_destroy / 60, time_source_units_seconds, function () {
	instance_destroy();	
})

time_source_start(time_source_destroy_tentacles);