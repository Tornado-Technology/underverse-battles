/// @desc Gasterblasters
if (started) exit;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if (_time == 1)
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
		break;
	
	case 1: // Крестовые гастербластеры
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_1_1(_power);
		time_source_start(time_source_update_1_1);
		time_source_start(time_source_update_destroy_1_1);
		break;
	case 2: // Гастербластеры сверху
		_border = battle_border_create(battle_border.up - 25, battle_border.down - 25, battle_border.left - 43, battle_border.right - 43);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		update_1_2(_power);
		time_source_start(time_source_update_1_2);
		time_source_start(time_source_update_destroy_1_2);
		
		time_source_start(time_source_update_1_2_2);
		break;
}

started = true;