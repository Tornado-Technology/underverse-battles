/// @description Time sources

// Кости и шипы со всех сторон
if (_id == 0 && attack_num == 0) {
	var period = 20;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow);
	}, [_power], -1);
	var period = 25;
	time_source_update_0_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_0_2(pow);
	}, [_power], -1);
	time_source_update_destroy_0_0 = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Парные шипы
if (_id == 0 && attack_num == 1) {
	var period = 22 - _power * 3;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], -1);
	time_source_update_destroy_0_1 = time_source_create(time_source_game, (340 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Двигающаяся арена
if (_id == 0 && attack_num == 2) {
	time_source_update_0_2 = time_source_create(time_source_game, 1/6, time_source_units_seconds, function (pow) {
		update_0_2(pow);
		time_source_start(time_source_update_0_2_2);
	}, [_power]);
	time_source_update_0_2_2 = time_source_create(time_source_game, 1/60, time_source_units_seconds, function (pow) {
		update_0_2_2(pow);
	}, [_power], -1);
	time_source_update_destroy_0_2 = time_source_create(time_source_game, (300 + 25 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Тыкающие кости справа и слева
if (_id == 0 && attack_num == 3) {
	var period = 25 - _power * 2;
	time_source_update_0_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_3(pow);
	}, [_power], -1);
	time_source_update_destroy_0_3 = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Нити
if (_id == 1) {
	var period = 45;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], -1);
	var period = 38 - _power * 3;
	time_source_update_1_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0_2(pow);
	}, [_power], -1);
	time_source_update_destroy_1_0 = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Турбо бластер следует за душой
if (_id == 2 && attack_num == 0) {
	var period = 65 - _power * 5;
	var amount = (5 + _power);
	time_source_update_2_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_0();
	}, [], amount - 1);
	time_source_update_destroy_2_0 = time_source_create(time_source_game, (period * amount) / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Турбо бластер сверху
if (_id == 2 && attack_num == 1) {
	var period = 65 - _power * 5;
	var amount = (5 + _power);
	time_source_update_2_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_1();
	}, [], amount - 1);
	time_source_update_destroy_2_1 = time_source_create(time_source_game, (period * amount) / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Редактирование
if (_id == 3) {
	var period = 7;
	var amount = 85;
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_3_0();
	}, [], amount);
	time_source_update_destroy_3_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}