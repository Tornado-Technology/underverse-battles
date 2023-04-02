/// @desc Bones
if (started) exit;

switch (attack_num) {
	case 0:	// Волна из костей
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_0(_power);
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_destroy_0_0);
		break;
		
	case 1: // Летящие кости справа и слева
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Attack
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_1(_power);
		time_source_start(time_source_update_0_1);
		time_source_start(time_source_update_destroy_0_1);
		break;
		
	case 2: // Две кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		_side = irandom_range(0, 1);

		update_0_2(_power);
		time_source_start(time_source_update_0_2);
		time_source_start(time_source_update_destroy_0_2);
		break;
		
	case 3: // Летящие кости сверху
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		update_0_3(_power);
		time_source_start(time_source_update_0_3);
		time_source_start(time_source_update_destroy_0_3);
	break;
}

started = true;