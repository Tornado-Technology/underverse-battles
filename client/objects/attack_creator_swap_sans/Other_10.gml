/// @desc Bones
if (started) exit;

switch (attack_num) {
	case 0:	// Кости на всю высоту
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		update_0_0(_power);
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_stop_0_0);
		time_source_start(time_source_update_destroy_0_0);
		break;
		
	case 1: // Кости и оранжевые кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_1(_power);
		time_source_start(time_source_update_0_1);
		time_source_start(time_source_update_stop_0_1);
		time_source_start(time_source_update_destroy_0_1);
		break;
		
	case 2: // Авиаудар костями
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left - 15, battle_border.right - 15);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		update_0_2(_power);
		time_source_start(time_source_update_0_2);
		time_source_start(time_source_update_stop_0_2);
		time_source_start(time_source_update_destroy_0_2);
		break;
}

started = true;