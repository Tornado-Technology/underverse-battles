/// @desc Gasterblasters
if (started) exit;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		update_2_0();
		time_source_start(time_source_update_2_0);
		time_source_start(time_source_update_destroy_2_0);
		break;
	
	case 1: // Крестовые гастербластеры
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_2_1();
		time_source_start(time_source_update_2_1);
		time_source_start(time_source_update_destroy_2_1);
		break;
}

started = true;