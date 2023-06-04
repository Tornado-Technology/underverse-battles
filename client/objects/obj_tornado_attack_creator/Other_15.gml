/// @description Time sources

// Кружка чая
if (_id == 0 && attack_num == 0) {
	var final_time = 320 + 20 * _power;
	time_source_update_destroy_0_0 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Атака 1
if (_id == 0 && attack_num == 1) {
	var period = 48 - _power * 5;
	time_source_update_0_1 = time_source_create(time_source_game, 1 / 2, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], -1);
	var final_time = 320 + 20 * _power;
	time_source_update_destroy_0_1 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Притяжение
if (_id == 0 && attack_num == 2) {
	var period = 60;
	time_source_update_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_2(pow);
	}, [_power], -1);
	period = 120;
	time_source_update_0_2_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_0_2_2(pow);
	});
	var final_time = 320 + 20 * _power;
	time_source_update_destroy_0_2 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}