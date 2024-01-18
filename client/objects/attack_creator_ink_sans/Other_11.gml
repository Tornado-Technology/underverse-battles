/// @desc Broomie
_border = battle_border_create(battle_border.up-30, battle_border.down-30, battle_border.left-30, battle_border.right-30);

time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
	_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red, fight_network_mode);

	switch (attack_num) {
		case 0: // Кисть на 72 градуса
			update_1_0(_power);
			time_source_start(time_source_update_1_0);
			time_source_start(time_source_update_destroy_1_0);
			break;
	
		case 1: // Кисть на 360 градусов
			update_1_1(_power);
			time_source_start(time_source_update_1_1);
			time_source_start(time_source_update_destroy_1_1);
			break;
	}
});
time_source_start(time_source_border_delay);