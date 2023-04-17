/// @description Time sources

// Кости на всю высоту
if (_id == 0 && attack_num == 0) {
	var period = 50 - _power * 5;
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
	var period = 50 - _power * 5;
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

// Вылезающие кости из стенок
if (_id == 0 && attack_num == 2) {
	var period = 40 - _power * 4;
	time_source_update_0_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_0_2();
		time_source_start(time_source_update_0_2_2);
	}, [], -1);
	time_source_update_0_2_2 = time_source_create(time_source_game, 1/3, time_source_units_seconds, function (bone_old, bone_new) {
		update_0_2_2(bone_old, bone_new);
	}, [bone_moving, bone_new]);
	time_source_update_destroy_0_2 = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Две кости
if (_id == 0 && attack_num == 3) {
	var period = 60 - 5 * _power;
	var amount = 5 + _power;
	time_source_update_0_3 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_3(pow);
	}, [_power], amount - 1);

	time_source_update_destroy_0_3 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
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
		
	time_source_update_destroy_1_1 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Кости в виде платформ и гастербластеры
if (_id == 1 && attack_num == 2) {
	var period = 65 - _power * 6;
	var amount = 5 + _power;
	
	time_source_update_1_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_1_2();
	}, [], amount - 1);
	time_source_update_destroy_1_2 = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
		instance_destroy();
	});
	
	var period = 60 - _power * 4;
	time_source_update_1_2_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_2_2(pow);
	}, [_power], -1);
}

// Оранжевая атака
if (_id == 2 && attack_num == 0) {
	var period = 80;
	var time_step = 28;
	var final_time = period*5;
	switch (_power) {
		case 1:
			period = 70;
			time_step = 25;
			final_time = period*6;
			break;
		case 2:
			period = 65;
			time_step = 22;
			final_time = period*7;
			break;
		case 3:
			period = 60;
			time_step = 18;
			final_time = period*8;
			break;
		case 4:
			period = 55;
			time_step = 15;
			final_time = period*10;
			break;
	}
	
	time_source_update_2_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
		update_2_0();
		time_source_start(time_source_update_2_0_2);
	}, [], -1);
	
	time_source_update_2_0_2 = time_source_create(time_source_game, time_step / 60, time_source_units_seconds, function () {
		update_2_0_2();
	});
	
	time_source_update_destroy_2_0 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		//character_instance.stop_hand_wave();
		instance_destroy();
	});
}

if (_id == 2 && attack_num == 1) {
	var period = 75;
	var time_step = [30, 5, 25, 5];
	var final_time = _period*5;
	switch (_power) {
		case 1:
			period = 70;
			time_step = [30, 5, 25, 5];
			final_time = _period*6;
			break;
		case 2:
			period = 66;
			time_step = [25, 5, 25, 5];
			final_time = _period*6;
			break;
		case 3:
			period = 62;
			time_step = [20, 5, 25, 5];
			final_time = _period*7;
			break;
		case 4:
			_period = 58;
			if (attack_num == 0) _time_step = [18, 4, 40, 4];
			if (attack_num == 1) _time_step = [15, 5, 45, 5];
			final_time = _period*10;
			break;
	}
	
	time_source_update_2_1 = time_source_create(time_source_game, _period / 60, time_source_units_seconds, function () {
		update_2_1();
		time_source_start(time_source_update_2_1_2);
	}, [], -1);
	
	time_source_update_2_1_2 = time_source_create(time_source_game, _time_step[0] / 60, time_source_units_seconds, function () {
		update_2_1_2();
		time_source_start(time_source_update_2_1_3);
	});
	
	time_source_update_2_1_3 = time_source_create(time_source_game, _time_step[2] / 60, time_source_units_seconds, function () {
		update_2_1_3();
	});
	
	time_source_update_destroy_2_1 = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
		character_instance.stop_hand_wave();
		instance_destroy();
	});
}