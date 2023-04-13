/// @description Error bones
if (started) exit;

switch (attack_num) {
	case 0:	// Падающие кости
		_border = battle_border_create(battle_border.up - 15, battle_border.down - 15, battle_border.left - 25, battle_border.right - 25);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_0(_power, dir.up);
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_destroy_0_0);
		break;
		
	case 1: // Тыкающие кости
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;
	
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_1(_power);
		time_source_start(time_source_update_0_1);
		time_source_start(time_source_update_destroy_0_1);
			
		if(_time > 320 + 20 * _power)
			instance_destroy();
	break;
	
	case 2: // Две кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		_side = choose(dir.up, dir.left);
		update_0_2(_power);
		time_source_start(time_source_update_0_2);
		time_source_start(time_source_update_destroy_0_2);
		break;
		
	case 3: // Платформы и падающие кости
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		var main_speed = 1 + _power * 0.2;
		create_moving_platforms(_border.x - _border.left - 40, _border.y - 20, 2, 10, 120, main_speed);
		create_moving_platforms(_border.x + _border.right + 40, _border.y + 20, 2, 10, 120, -main_speed);
		
		update_0_3(_power);
		time_source_start(time_source_update_0_3);
		time_source_start(time_source_update_0_3_2);
		time_source_start(time_source_update_destroy_0_3);
		break;
}

started = true;