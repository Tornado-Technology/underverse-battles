/// @description Time sources

// Падающие кости
if (_id == 0 && attack_num == 0) {
	var period = 18 - 2 * _power;
	time_source_update_0_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow, dir.up);
	}, [_power], -1);
	
	time_source_update_destroy_0_0 = time_source_create(time_source_game, (250 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Тыкающие кости
if (_id == 0 && attack_num == 1) {
	var period = 20 - 2 * _power;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], -1);
	
	time_source_update_destroy_0_1 = time_source_create(time_source_game, (300 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Две кости
if (_id == 0 && attack_num == 2) {
	var period = 60 - 5 * _power;
	var amount = 5 + _power;
	time_source_update_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_2(pow);
	}, [_power], amount - 1);

	time_source_update_destroy_0_2 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Платформы и падающие кости
if (_id == 0 && attack_num == 3) {
	var period = 32 - 3 * _power;
	time_source_update_0_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		var side = choose(dir.up, dir.down);
		update_0_0(pow, side);
	}, [_power], -1);
	
	time_source_update_0_3_2 = time_source_create(time_source_game, 2 / (1 + _power * 0.2), time_source_units_seconds, function (pow) {
		update_0_3(pow);
	}, [_power], -1);

	time_source_update_destroy_0_3 = time_source_create(time_source_game, (280 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Нити
if (_id == 1) {
	var period = 38 - _power * 3;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], -1);
	
	time_source_update_destroy_1_0 = time_source_create(time_source_game, 5, time_source_units_seconds, function () {
		if (!_soul.is_stunned) {
			instance_destroy();
		}
		else {
			time_source_stop(time_source_update_1_0);
			time_source_start(time_source_update_1_0_2);
			time_source_start(time_source_update_destroy_1_0_2);
		}
	});
	
	var amount = 1 + _power;
	time_source_update_1_0_2 = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
		update_1_0_2();
	}, [_power], amount);

	time_source_update_destroy_1_0_2 = time_source_create(time_source_game, amount * 1/6 + 1, time_source_units_seconds, function () {
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
	
// Платформы и гастербластеры
if (_id == 2 && attack_num == 2) {
	var period = 65 - _power * 6;
	var amount = 5 + _power;
	time_source_update_2_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_2(pow);
	}, [_power], amount - 1);
	
	time_source_update_2_2_2 = time_source_create(time_source_game, 1 / (0.5 + _power * 0.1), time_source_units_seconds, function (pow) {
		update_2_2_2(pow);
	}, [_power], -1);
		
	time_source_update_destroy_2_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Паническая атака
if (_id == 3) {
	var period = 4;
	var amount = 80;
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_3_0();
	}, [], amount - 1);
		
	time_source_update_destroy_3_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		time_source_start(time_source_update_3_1);
		time_source_start(time_source_update_destroy_3_1);
	});
	
	period = 40;
	amount = 6;
	time_source_update_3_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_3_1();
	}, [], amount - 1);
		
	time_source_update_destroy_3_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}