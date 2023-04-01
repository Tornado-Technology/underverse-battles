/// @description Time sources
event_inherited();

// Кости вылезают из стенок
if (_id == 0 && attack_num == 0) {
	var period = 30 - 3 * _power;
	var amount = 8 + _power;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow);
	}, [_power], amount - 1);

	time_source_update_destroy_0_0 = time_source_create(time_source_game, period * amount / 60 + 0.5, time_source_units_seconds, function () {
		instance_destroy();
	});
}
	
// Кости вылетают справа и слева
if (_id == 0 && attack_num == 1) {
	var period = 16 - 2 * _power;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], -1);

	time_source_update_destroy_0_1 = time_source_create(time_source_game, (240 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}
	
// Обстрел костями сверху
if (_id == 0 && attack_num == 2) {
	var period = 20 - 3 * _power;
	time_source_update_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_2(pow);
	}, [_power], -1);

	time_source_update_stop_0_2 = time_source_create(time_source_game, (240 + 20 * _power) / 60, time_source_units_seconds, function () {
		time_source_stop(time_source_update_0_2);
	});
	
	time_source_update_destroy_0_2 = time_source_create(time_source_game, (280 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Платформы и кости
if (_id == 0 && attack_num == 3) {
	time_source_update_0_3 = time_source_create(time_source_game, (60 - 5 * _power) / 60, time_source_units_seconds, function (pow) {
		update_0_3(pow);
	}, [_power], -1);

	time_source_update_0_3_2 = time_source_create(time_source_game, 2, time_source_units_seconds, function (pow) {
		update_0_3_2(pow);
	}, [_power], 3);
	
	time_source_update_0_3_3 = time_source_create(time_source_game, 1 - _power * 0.1, time_source_units_seconds, function (pow) {
		update_0_3_3(pow);
	});

	time_source_update_destroy_0_3 = time_source_create(time_source_game, (360 + 50 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Синяя душа и гастербластеры
if (_id == 1 && attack_num == 1) {
	var period = 54 - _power * 4;
	var amount = 6 + _power;
	time_source_update_1_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_1(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_1_0_2 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Крестоносец
if (_id == 3) {
	var period = 50;
	var amount = 2;
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_3_0();
	}, [], amount);
	
	time_source_update_destroy_3_0 = time_source_create(time_source_game, period * (amount + 1) / 60 + 0.5, time_source_units_seconds, function () {
		time_source_stop(time_source_update_3_0);
		time_source_start(time_source_update_3_1);
		instance_destroy();
	});
}