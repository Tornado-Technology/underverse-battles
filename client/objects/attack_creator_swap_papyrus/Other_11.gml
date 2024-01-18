/// @desc Gasterblasters
_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.orange, fight_network_mode);
		
			stage = irandom_range(1, 2);
			if (stage == 1) {
				update_1_0(_power);
				time_source_start(time_source_update_1_0);
				time_source_start(time_source_update_destroy_1_0);
			}
			else {
				update_1_0_2(_power);
				time_source_start(time_source_update_1_0_2);
				time_source_start(time_source_update_destroy_1_0_2);
			}
		});
		time_source_start(time_source_border_delay);
		break;
	
	case 1: // Крестовые гастербластеры
		
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.red, fight_network_mode);
		
			update_1_1(_power);
			time_source_start(time_source_update_1_1);
			time_source_start(time_source_update_destroy_1_1);
		});
		time_source_start(time_source_border_delay);
		break;
	
	case 2: // Кости в виде платформ и гастербластеры
		_border = battle_border_create(battle_border.up - 35, battle_border.down - 35, battle_border.left, battle_border.right);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			var _soul_pos = irandom_range(0, 2);
		
			if (_soul_pos == 0)
				_soul = create_soul(_border.x, _border.y + _border.down / 2, battle_soul_type.orange, fight_network_mode);
			if (_soul_pos == 1)
				_soul = create_soul(_border.x, _border.y, battle_soul_type.orange, fight_network_mode);
			if (_soul_pos == 2)
				_soul = create_soul(_border.x, _border.y - _border.up / 2, battle_soul_type.orange, fight_network_mode);
		
			update_1_2();
			update_1_2_2(_power);
			time_source_start(time_source_update_1_2);
			time_source_start(time_source_update_1_2_2);
			time_source_start(time_source_update_destroy_1_2);
		});
		time_source_start(time_source_border_delay);
		break;
}