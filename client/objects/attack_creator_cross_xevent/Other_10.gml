/// @desc Bones
switch (attack_num) {
	case 0:	// Кости вылезают из стенок
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			create_soul(_border.x, _border.y, battle_soul_type.red);
		
			update_0_0(_power);
			time_source_start(time_source_update_0_0);
			time_source_start(time_source_update_destroy_0_0);
		});
		time_source_start(time_source_border_delay);
		break;
	
	case 1:	// Кости вылетают справа и слева
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			create_soul(_border.x, _border.y, battle_soul_type.red);
		
			update_0_1(_power);
			time_source_start(time_source_update_0_1);
			time_source_start(time_source_update_destroy_0_1);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 2: // Обстрел костями сверху
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
			update_0_2(_power);
			time_source_start(time_source_update_0_2);
			time_source_start(time_source_update_stop_0_2);
			time_source_start(time_source_update_destroy_0_2);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 3: // Платформы и кости
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
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
		});
		time_source_start(time_source_border_delay);
		break;
}