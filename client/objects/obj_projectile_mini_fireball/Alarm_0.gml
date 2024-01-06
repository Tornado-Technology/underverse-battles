if (is_auto_destroy) {
	time_source_to_destroy = time_source_create(time_source_game, time_to_destroy, time_source_units_seconds, function() {
		instance_destroy(id);
		time_source_destroy(time_source_to_destroy);
	});

	time_source_start(time_source_to_destroy);

}