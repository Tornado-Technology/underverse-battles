event_inherited();

destroy = false;

time_source_self_destroy = time_source_create(time_source_game, 20 / 60, time_source_units_seconds, function () {
	destroy = true;	
});
