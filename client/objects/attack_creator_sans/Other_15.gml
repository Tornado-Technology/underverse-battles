/// @description Time sources

// Волна из костей
if (_id == 0 && attack_num == 0) {
	time_source_update_0_0 = time_source_create(time_source_game, (10 - _power) / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow);
	}, [_power], -1);
	
	time_source_update_stop_0_0 = time_source_create(time_source_game, (280 + 20 * _power) / 60, time_source_units_seconds, function () {
		time_source_stop(time_source_update_0_0);
	});

	time_source_update_destroy_0_0 = time_source_create(time_source_game, (300 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}
	
// Перепыгивание через кости
if (_id == 0 && attack_num == 1) {
	var period = 60;
	var amount = 4 + _power;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], amount - 1);

	time_source_update_destroy_0_1 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
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

// Платформы и кости
if (_id == 0 && attack_num == 3) {
	time_source_update_0_3 = time_source_create(time_source_game, (60 - 5 * _power) / 60, time_source_units_seconds, function (pow) {
		update_0_3(pow);
	}, [_power], -1);

	time_source_update_0_3_2 = time_source_create(time_source_game, 2, time_source_units_seconds, function (pow) {
		update_0_3_2(pow);
	}, [_power], 1 + _power);
	
	time_source_update_0_3_3 = time_source_create(time_source_game, 1 / (1 + _power * 0.1), time_source_units_seconds, function (pow) {
		update_0_3_3(pow);
	}, [_power], -1);

	time_source_update_destroy_0_3 = time_source_create(time_source_game, (360 + 50 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Сдвиг и перепрыгивание
if (_id == 0 && attack_num == 4) {
	period = 60 - _power * 4;
	var amount = 5 + _power;
	time_source_update_0_4 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_4(pow);
	}, [_power], amount - 1);

	time_source_update_destroy_0_4 = time_source_create(time_source_game, ((260 + 60 * _power) + period) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Наводящиеся гастербластеры
if (_id == 1 && attack_num == 0) {
	var period = 50 - _power * 5;
	var amount = 7 + _power;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_1_0 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
	
	period = 54 - _power * 4;
	amount = 6 + _power;
	time_source_update_1_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0_2(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_1_0_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}
	
// Крестовые гастербластеры
if (_id == 1 && attack_num == 1) {
	period = 65 - _power * 6;
	amount = 5 + _power;
	time_source_update_1_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_1(pow);
	}, [_power], amount - 1);
		
	time_source_update_destroy_1_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}
	
// Платформы и гастербластеры
if (_id == 1 && attack_num == 2) {
	period = 65 - _power * 6;
	amount = 5 + _power;
	time_source_update_1_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_2(pow);
	}, [_power], amount - 1);
	
	time_source_update_1_2_2 = time_source_create(time_source_game, 1 / (0.5 + _power * 0.1), time_source_units_seconds, function (pow) {
		update_1_2_2(pow);
	}, [_power], -1);
		
	time_source_update_destroy_1_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Синяя атака
if (_id == 2) {
	switch (_power) {
		case 0:
			_period = 75;
			_time_step = [30, 5, 25, 5];
			final_time = _period*5;
			break;
		case 1:
			_period = 70;
			_time_step = [30, 5, 25, 5];
			final_time = _period*6;
			break;
		case 2:
			_period = 66;
			_time_step = [25, 5, 25, 5];
			final_time = _period*6;
			break;
		case 3:
			_period = 62;
			_time_step = [20, 5, 25, 5];
			final_time = _period*7;
			break;
		case 4:
			_period = 58;
			if (attack_num == 0) _time_step = [18, 4, 30, 4];
			if (attack_num == 1) _time_step = [15, 4, 30, 4];
			final_time = _period*10;
			break;
	}
	
	time_source_update_2_0 = time_source_create(time_source_game, _period / 60, time_source_units_seconds, function () {
		update_2_0();
		time_source_start(time_source_update_2_1);
	}, [], -1);
	
	time_source_update_2_1 = time_source_create(time_source_game, _time_step[0] / 60, time_source_units_seconds, function () {
		update_2_1();
		time_source_start(time_source_update_2_2);
	});
	
	time_source_update_2_2 = time_source_create(time_source_game, _time_step[2] / 60, time_source_units_seconds, function () {
		update_2_2();
	});
	
	time_source_update_destroy_2_2 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		character_instance.stop_hand_wave();
		instance_destroy();
	});
}

// Плохое время
if (_id == 3) {
	var period = 62;
	var amount = 3; 
	_time_step = [20, 5, 25, 5];
	final_time = period * amount;
	
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_0();
		time_source_start(time_source_update_3_1);
	}, [], amount - 1);
	
	time_source_update_3_1 = time_source_create(time_source_game, _time_step[0] / 60, time_source_units_seconds, function () {
		update_2_1();
		time_source_start(time_source_update_3_2);
	});
	
	time_source_update_3_2 = time_source_create(time_source_game, _time_step[2] / 60, time_source_units_seconds, function () {
		update_2_2();
	});
	
	time_source_update_destroy_3_2 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function (pow) {
		character_instance.stop_hand_wave();
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		update_0_2(pow);
		time_source_stop(time_source_update_3_0);
		time_source_stop(time_source_update_3_1);
		time_source_start(time_source_update_3_3);
		time_source_start(time_source_update_destroy_3_3);
	}, [3]);
	
	var period = 45;
	var amount = 4;
	time_source_update_3_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_2(pow);
	}, [3], amount - 1);

	time_source_update_destroy_3_3 = time_source_create(time_source_game, (period * amount / 60) + 1, time_source_units_seconds, function () {
		if (attack_num == 0)
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.blue);
		else
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		
		update_2_0();
		time_source_stop(time_source_update_3_3);
		time_source_start(time_source_update_3_0);
		time_source_start(time_source_update_3_1);
		time_source_start(time_source_update_destroy_3_4);
	});
	
	time_source_update_destroy_3_4 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		character_instance.stop_hand_wave();
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		_angle = choose(0, 90, -180, -90);
		angle_step = 10;
		update_3_5();
		time_source_stop(time_source_update_3_0);
		time_source_stop(time_source_update_3_1);
		time_source_start(time_source_update_3_5);
		time_source_start(time_source_update_change_3_5);
		time_source_start(time_source_update_destroy_3_5);
	});
	
	var period = 5;
	var amount = 118;
	time_source_update_3_5 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_3_5();
	}, [], amount - 1);
	
	time_source_update_change_3_5 = time_source_create(time_source_game, period * amount / 120, time_source_units_seconds, function () {
		update_3_5_2();
	});
	
	time_source_update_destroy_3_5 = time_source_create(time_source_game, (period * amount / 60) + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}