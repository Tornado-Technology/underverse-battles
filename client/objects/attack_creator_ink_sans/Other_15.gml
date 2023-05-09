/// @description Time sources

// Капли падают сверху
if (_id == 0 && attack_num == 0) {
	var period = 10 - _power;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_0_0();
	}, [], -1);
	time_source_update_destroy_0_0 = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Капли летят сбоку
if (_id == 0 && attack_num == 1) {
	var period = 10 - _power;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], -1);
	time_source_update_destroy_0_1 = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Кисть на 72 градуса
if (_id == 1 && attack_num == 0) {
	var period = 80 - _power * 10;
	var amount = 6 + _power;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_1_0 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Кисть на 360 градусов
if (_id == 1 && attack_num == 1) {
	var period = 100 - _power * 10;
	var amount = 5 + _power;
	time_source_update_1_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_1(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_1_1 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Наводящиеся гастербластеры
if (_id == 2 && attack_num == 0) {
	var period = 50 - _power * 5;
	var amount = 5 + _power;
	time_source_update_2_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_0(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_2_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Крестовые гастербластеры
if (_id == 2 && attack_num == 1) {
	var period = 65 - _power * 6;
	var amount = 5 + _power;
	time_source_update_2_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_1();
	}, [_power], amount - 1);
	time_source_update_destroy_2_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Чернильный взрыв
if (_id == 3) {
	var period = 100;
	var amount = 4;
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_0(pow);
	}, [0], amount);
	period = 80;
	amount = 5;
	time_source_update_3_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_1(pow);
	}, [3], amount);
	time_source_update_destroy_3_0 = time_source_create(time_source_game, 540 / 60, time_source_units_seconds, function () {
		instance_destroy();
	}, [], amount);
}