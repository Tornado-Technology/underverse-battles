start_time = 0.5;
damage = 0;

started = false;

time_sourse = time_source_create(time_source_game, start_time, time_source_units_seconds, function() {
	event_user(0);
});

time_source_start(time_sourse);