/// @description Time sources

// Кости на всю высоту
if (_id == 0 && attack_num == 0) {
	var period = 48 - _power * 5;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow);
	}, [_power], -1);
	var final_time = 240 + 20 * _power;
	time_source_update_stop_0_0 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function (pow) {
		time_source_stop(time_source_update_0_0);
	}, [_power], -1);
	time_source_update_destroy_0_0 = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Кости и оранжевые кости
if (_id == 0 && attack_num == 1) {
	var period = 48 - _power * 5;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], -1);
	var final_time = 280 + 20 * _power;
	time_source_update_stop_0_1 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function (pow) {
		time_source_stop(time_source_update_0_1);
	}, [_power], -1);
	time_source_update_destroy_0_1 = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Авиаудар костями
if (_id == 0 && attack_num == 2) {
	var period = 16 - 3 * _power;
	time_source_update_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_2(pow);
	}, [_power], -1);
	var final_time = 240 + 60 * _power;
	time_source_update_stop_0_2 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		time_source_stop(time_source_update_0_2);
	});
	time_source_update_destroy_0_2 = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Вращающиеся кости крестом с перемещением
if (_id == 1 && attack_num == 0) {
	var period = 90 - _power * 5;
	var amount = 4 + _power;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_1_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Вращающиеся кости крестом по центру
if (_id == 1 && attack_num == 1) {
	var period = 80 - _power * 5;
	time_source_update_1_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_1_1();
	}, [], -1);
	time_source_update_destroy_1_1 = time_source_create(time_source_game, (300 + 25 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Вращающиеся кости с двух сторон с перемещением
if (_id == 1 && attack_num == 2) {
	var period = 50 - _power * 5;
	time_source_update_1_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_2(pow);
	}, [_power], -1);
	var final_time = 240 + 20 * _power;
	time_source_update_stop_1_2 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		time_source_stop(time_source_update_1_2);
	});
	time_source_update_destroy_1_2 = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Наводящиеся гастербластеры
if (_id == 2 && attack_num == 0) {
	var period = 50 - _power * 5;
	var amount = 7 + _power;
	time_source_update_2_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_0(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_2_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
	
	period = 54 - _power * 4;
	amount = 6 + _power;
	time_source_update_2_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_0_2(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_2_0_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}
	
// Крестовые гастербластеры
if (_id == 2 && attack_num == 1) {
	var period = 65 - _power * 6;
	var amount = 5 + _power;
	time_source_update_2_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_1(pow);
	}, [_power], amount - 1);
		
	time_source_update_destroy_2_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Два гастербластера в три ряда
if (_id == 2 && attack_num == 2) {
	var period = 65 - _power * 6;
	var amount = 6 + _power;
	
	time_source_update_2_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_2();
	}, [], amount - 1);
	time_source_update_destroy_2_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

if (_id == 3) {
	var period = 100;
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_3_0();
	}, [], -1);
	period = 60;
	time_source_update_3_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_3_1();
	}, [], -1);
	var final_time = 450;
	time_source_update_stop_3_0 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		time_source_stop(time_source_update_3_0);
		time_source_stop(time_source_update_3_1);
		time_source_start(time_source_update_destroy_3_0);
	});
	time_source_update_destroy_3_0 = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}