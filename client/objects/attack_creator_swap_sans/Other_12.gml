/// @desc Gasterblasters
if (started) exit;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		stage = irandom_range(1, 2);
		if (stage == 1) {
			update_2_0(_power);
			time_source_start(time_source_update_2_0);
			time_source_start(time_source_update_destroy_2_0);
		}
		else {
			update_2_0_2(_power);
			time_source_start(time_source_update_2_0_2);
			time_source_start(time_source_update_destroy_2_0_2);
		}
		break;
	
	case 1: // Крестовые гастербластеры
		
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_2_1(_power);
		time_source_start(time_source_update_2_1);
		time_source_start(time_source_update_destroy_2_1);
		break;
	
	case 2: // Два гастербластера в три ряда
		_border = battle_border_create(battle_border.up - 36, battle_border.down - 36, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		var _soul_pos = irandom_range(0, 2);
		
		if (_soul_pos == 0)
			_soul = create_soul(_border.x, _border.y + _border.down / 2, battle_soul_type.orange);
		if (_soul_pos == 1)
			_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		if (_soul_pos == 2)
			_soul = create_soul(_border.x, _border.y - _border.up / 2, battle_soul_type.orange);
		
		update_2_2();
		time_source_start(time_source_update_2_2);
		time_source_start(time_source_update_destroy_2_2);
		break;
}

started = true;