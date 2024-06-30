alpha = 0;

time_source_alpha = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	alpha -= 0.001;
}, [], 1000);

time_source_start(time_source_alpha);