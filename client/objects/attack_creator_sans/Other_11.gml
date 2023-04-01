/// @desc Gasterblasters
if (started) exit;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
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
	case 2: // Платформы и гастербластеры
	
		_border = battle_border_create(battle_border.up - 15, battle_border.down - 15, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		var sector_y_step = 35;
		var sector_y = _border.y - _border.up + 25;
		
		var main_speed = 0.5 + _power * 0.1;
		create_moving_platforms(_border.x - _border.left - 40, sector_y, 4, 6, 60, main_speed);
		create_moving_platforms(_border.x + _border.right + 40, sector_y + sector_y_step, 4, 6, 60, -main_speed);
		create_moving_platforms(_border.x - _border.left - 40,  sector_y + sector_y_step * 2, 4, 6, 60, main_speed);
		
		var soul_offset = 5;
		var soul_position = choose(Vector2(_border.x - 38, sector_y - soul_offset), Vector2(_border.x + 12, sector_y + sector_y_step - soul_offset), Vector2(_border.x - 38, sector_y + sector_y_step * 2 - soul_offset));
		_soul = create_soul(soul_position.x, soul_position.y, battle_soul_type.blue);
			
		// bones
		var i = 0; repeat(20) {
			create_bone(_border.x - _border.left + i * 8, _border.y + _border.down + 3, bone_obj, 0, 1, 0, 0);
			i++;
		}
		
		update_1_2(_power);
		time_source_start(time_source_update_1_2);
		time_source_start(time_source_update_1_2_2);
		time_source_start(time_source_update_destroy_1_2);
		break;
}

started = true;