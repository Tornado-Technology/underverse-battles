/// @desc Damage wave
if (started) exit;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Волна урона в сторону души
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		update_1_0();
		time_source_start(time_source_update_1_0);
		time_source_start(time_source_update_destroy_1_0);
	break;
	
	case 1: // Волна урона в сторону центра
		
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		update_1_1();
		time_source_start(time_source_update_1_1);
		time_source_start(time_source_update_destroy_1_1);
	break;
	
	case 2: // Волна урона с предупреждением
		
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		update_1_2();
		time_source_start(time_source_update_1_2);
		time_source_start(time_source_update_1_2_2);
		time_source_start(time_source_update_destroy_1_2);
	break;
}

started = true;