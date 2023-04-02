/// @description Time sources

// Волна из костей
if (_id == 0 && attack_num == 0) {
	time_source_update_0_0 = time_source_create(time_source_game, (10 - _power) / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow);
	}, [_power], -1);
	time_source_update_destroy_0_0 = time_source_create(time_source_game, (300 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Летящие кости справа и слева
if (_id == 0 && attack_num == 1) {
	var period = 33 - 2 * _power;
	var amount = 10 + _power * 2;
	time_source_update_0_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_0_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
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
	time_source_update_destroy_0_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Летящие кости сверху
if (_id == 0 && attack_num == 3) {
	var period = 33 - 3 * _power;
	var amount = 10 + _power * 2;
	time_source_update_0_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_3(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_0_3 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
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
	var period = 65 - _power * 6;
	var amount = 5 + _power;
	time_source_update_1_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_1(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_1_1 = time_source_create(time_source_game, period * amount / 60 + 0.5, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Гастербластеры сверху
if (_id == 1 && attack_num == 2) {
	var period = 65 - _power * 6;
	var amount = 5 + _power;
	time_source_update_1_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_2(pow);
	}, [_power], amount - 1);
	time_source_update_destroy_1_2 = time_source_create(time_source_game, period * amount / 60 + 0.5, time_source_units_seconds, function () {
		instance_destroy();
	});
	period += 30;
	time_source_update_1_2_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_2_2(pow);
	}, [_power], -1);
}

// Синяя атака
if (_id == 2) {
	switch (_power) {
		default:
		case 0:
			_period = 80;
			final_time = _period*5;
			break;
		case 1:
			_period = 70;
			final_time = _period*6;
			break;
		case 2:
			_period = 65;
			final_time = _period*6;
			break;
		case 3:
			_period = 60;
			final_time = _period*7;
			break;
		case 4:
			_period = 55;
			final_time = _period*8;
			break;
	}
	
	time_source_update_2_0 = time_source_create(time_source_game, _period / 60, time_source_units_seconds, function (pow) {
		update_2_0(pow);
	}, [_power], -1);
	
	time_source_update_destroy_2_0 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		character_instance.stop_hand_wave();
		instance_destroy();
	});
}

// Прекрасное время
if (_id == 3) {
	var period = 27;
	var amount = 6;
	time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_1(pow);
	}, [3], amount - 1);
	
	time_source_update_destroy_3_0 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function (pow) {
		if (attack_num == 0)
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.blue);
		else
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		update_2_0(pow);
		time_source_start(time_source_update_3_1);
		time_source_start(time_source_update_destroy_3_1);
	}, [3]);
	
	time_source_update_destroy_3_2 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function (pow) {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		_angle = choose(0, 90, -180, -90);
		angle_step = 10;
		update_3_3(pow);
		time_source_start(time_source_update_3_3);
		time_source_start(time_source_update_3_3_2);
		time_source_start(time_source_update_destroy_3_3);
	}, [3]);
	
	var period = 60;
	var amount = 3;
	var final_time = period * amount;
	time_source_update_3_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_2_0(pow);
	}, [3], amount - 1);
	
	time_source_update_destroy_3_1 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function (pow) {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		character_instance.stop_hand_wave();
		update_0_1(pow);
		time_source_start(time_source_update_3_0);
		time_source_start(time_source_update_destroy_3_2);
	}, [3]);
	
	var period = 5;
	var amount = 72;
	time_source_update_3_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_3_3();
	}, [], amount - 1);
	
	time_source_update_3_3_2 = time_source_create(time_source_game, period * amount / 120, time_source_units_seconds, function () {
		update_3_3_2();
	});
	
	time_source_update_destroy_3_3 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}