event_inherited();

image_speed = 1;

time_source_period = time_source_create(time_source_game, 5, time_source_units_seconds, function() {
	image_speed = 1 - image_speed;
}, [], -1);

time_source_start(time_source_period);