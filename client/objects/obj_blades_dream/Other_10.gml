/// @description Time sources
time_sources_target = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	x += 5;
	y -= 5
});