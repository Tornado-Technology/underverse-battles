/// @description Time Sources

// Самонаводящиеся ножи
if (_id == 0 && attack_num == 0) {
	time_source_update_0_0 = time_source_create(time_source_game, (18 - _power * 2) / 60, time_source_units_seconds, function () {
		update_0_0();
	}, [], -1);
	time_source_update_destroy_0_0 = time_source_create(time_source_game, (250 + _power * 20) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Самонаводящиеся взрыв ножей
if (_id == 0 && attack_num == 1) {
	time_source_update_0_1 = time_source_create(time_source_game, (24 - _power * 2) / 60, time_source_units_seconds, function () {
		update_0_1();
	}, [], -1);
	time_source_update_destroy_0_1 = time_source_create(time_source_game, (260 + _power * 34) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Ножи справа и слева
if (_id == 0 && attack_num == 2) {
	time_source_update_0_2 = time_source_create(time_source_game, (14 - _power * 2) / 60, time_source_units_seconds, function () {
		update_0_2();
	}, [], -1);
	time_source_update_destroy_0_2 = time_source_create(time_source_game, (260 + _power * 34) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Ножи по кругу
if (_id == 0 && attack_num == 3) {
	var period = 15 - _power * 2;
	var amount = 18 + _power*6;
	time_source_update_0_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_0_3();
	}, [], -1);
	time_source_update_0_3_2 = time_source_create(time_source_game, (80 - _power * 5) / 60, time_source_units_seconds, function () {
		var rand_num = irandom_range(0, 1);
		if (rand_num == 0)
			rot = rot ? 0 : 1;
	}, [], -1);
	time_source_update_stop_0_3 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
		instance_destroy();
		time_source_start(time_source_update_destroy_0_3);
	});
	time_source_update_destroy_0_3 = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Волна урона в сторону души
if (_id == 1 && attack_num == 0) {
	var period = 62 - _power * 8;
	var amount = 6 + _power;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_1_0();
		time_source_start(time_source_update_1_0);
	}, [], amount - 1);
	time_source_update_destroy_1_0 = time_source_create(time_source_game, period * amount / 60 + 1.5, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Волна урона в сторону центра
if (_id == 1 && attack_num == 1) {
	var period = 110 - _power * 10;
	var amount = 6 + _power;
	time_source_update_1_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_1_1();
	}, [], amount - 1);
	time_source_update_destroy_1_1 = time_source_create(time_source_game, period * amount / 60 + 1.5, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Волна урона с предупреждением
if (_id == 1 && attack_num == 2) {
	var period = 140 - _power * 10;
	var amount = 3;
	time_source_update_1_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_1_2();
		time_source_start(time_source_update_1_2_2);
	}, [], amount - 1);
	time_source_update_1_2_2 = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
		update_1_2_2();
	});
	time_source_update_destroy_1_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Зоны урона на квадратной арене
if (_id == 2 && attack_num == 0) {
	var period = 18 - _power * 2;
	var amount = 15 + _power * 5;
	time_source_update_2_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_0();
	}, [], amount - 1);
	time_source_update_destroy_2_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Зоны урона на небольшой арене
if (_id == 2 && attack_num == 1) {
	var period = 28 - _power * 2;
	var amount = 12 + _power * 2;
	time_source_update_2_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_1();
	}, [], amount - 1);
	time_source_update_destroy_2_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}