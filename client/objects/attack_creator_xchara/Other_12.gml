/// @desc Damage zone
_power = (_power == 4) ? 5 : _power;

if (attack_num == 0) { 
	_border = battle_border_create(battle_border.up - 30 - _power * 2, battle_border.down - 30 - _power * 2, battle_border.left - 30 - _power * 2, battle_border.right - 30 - _power * 2);
	
	time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

		update_2_0();
		time_source_start(time_source_update_2_0);
		time_source_start(time_source_update_destroy_2_0);
	});
	time_source_start(time_source_border_delay);
}

if (attack_num == 1) { 
	_border = battle_border_create(battle_border.up - 60, battle_border.down - 60, battle_border.left - 20, battle_border.right - 20);
	
	time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

		update_2_1();
		time_source_start(time_source_update_2_1);
		time_source_start(time_source_update_destroy_2_1);
	});
	time_source_start(time_source_border_delay);
}