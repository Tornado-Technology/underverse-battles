/// @description Time sources
event_inherited();

// Нож режет арену и кости вылетают справа и слева
if (_id == 1 && attack_num == 0) {
	var period = 30 - 2 * _power;
	time_source_update_1_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_0_0(pow);
	}, [_power], amount - 1);
	
	time_source_update_1_0_2 = time_source_create(time_source_game, 1, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_1_0 = time_source_create(time_source_game, (300 + 30 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

if (_id == 1 && attack_num == 1) {
	time_source_update_1_1 = time_source_create(time_source_game, 0.5, time_source_units_seconds, function (pow) {
		update_1_1(pow);
	}, [_power]);
	
	time_source_update_destroy_1_1 = time_source_create(time_source_game, (240 + 70 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Перепрыгивание через кости с большим ножом
if (_id == 1 && attack_num == 2) {
	time_source_update_1_2 = time_source_create(time_source_game, 0.5, time_source_units_seconds, function (pow) {
		update_1_2(pow);
	}, [_power]);
	
	time_source_update_1_2_2 = time_source_create(time_source_game, 4/3, time_source_units_seconds, function (pow) {
		update_1_2_2(pow);
	}, [_power]);
	
	time_source_update_destroy_1_2 = time_source_create(time_source_game, (300 + 60 * _power) / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}

// Синяя душа и гастербластеры
if (_id == 2 && attack_num == 1) {
	var period = 54 - _power * 4;
	var amount = 6 + _power;
	time_source_update_2_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
		update_1_0(pow);
	}, [_power], amount - 1);
	
	time_source_update_destroy_2_0_2 = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
		instance_destroy();
	});
}