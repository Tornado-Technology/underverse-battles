/// @desc Bones
if (started) exit;

switch (attack_num) {
	case 0:	// Волна из костей
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
			
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_0(_power);
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_stop_0_0);
		time_source_start(time_source_update_destroy_0_0);
		break;
		
	case 1: // Перепыгивание через кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		update_0_1(_power);
		time_source_start(time_source_update_0_1);
		time_source_start(time_source_update_destroy_0_1);
		break;
		
	case 2: // Две кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		_side = choose(dir.up, dir.down);
		update_0_2(_power);
		time_source_start(time_source_update_0_2);
		time_source_start(time_source_update_destroy_0_2);
		break;
	
	case 3: // Платформы и кости
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		var main_speed = 1 + _power * 0.1;
		create_moving_platforms(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed);
		create_moving_platforms(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed);
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		_side = irandom_range(0, 1);
		update_0_3(_power);
		time_source_start(time_source_update_0_3);
		time_source_start(time_source_update_0_3_2);
		time_source_start(time_source_update_0_3_3);
		time_source_start(time_source_update_destroy_0_3);
		break;
	
	case 4: // Сдвиг и перепрыгивание
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		update_0_4(_power);
		time_source_start(time_source_update_0_4);
		time_source_start(time_source_update_destroy_0_4);
		break;
}

started = true;