blink = 0;
blink_count = 2;

is_active = false;

time_source_show = time_source_create(time_source_game, 0.5, time_source_units_seconds, function() {
	is_active = true;
	time_source_start(time_source_hide);
}, [], blink_count);

time_source_hide = time_source_create(time_source_game, 1/30, time_source_units_seconds, function() {
	is_active = false;
});

time_source_start(time_source_show);