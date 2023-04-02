/// @description Time sources

if (_id == 0 || attack_num == 0) {
	var period = 18 - 2 * _power;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_0_0();
	}, [_power], -1);
	
	time_source_update_destroy_0_0 = time_source_create(time_source_game, (250 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

if (_id == 0 || attack_num == 1) {
	
}