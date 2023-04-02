/// @description Time sources

if (_id == 0 || attack_num == 0) {
	var period = 18 - 2 * _power;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		
	});
}

if (_id == 0 || attack_num == 1) {
	
}