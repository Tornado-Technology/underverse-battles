/// @description Knives
_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0:	// Самонаводящиеся ножи
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.red, fight_network_mode);
		
			update_0_0();
			time_source_start(time_source_update_0_0);
			time_source_start(time_source_update_destroy_0_0);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 1:	// Самонаводящиеся взрыв ножей
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.red, fight_network_mode);
	
			update_0_1();
			time_source_start(time_source_update_0_1);
			time_source_start(time_source_update_destroy_0_1);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 2:	// Ножи справа и слева
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.red, fight_network_mode);
		
			update_0_2();
			time_source_start(time_source_update_0_2);
			time_source_start(time_source_update_destroy_0_2);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 3:	// Ножи по кругу
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(_border.x, _border.y, battle_soul_type.red, fight_network_mode);
		
			_side = 90;
			step = 20;
			rot = irandom_range(0, 1);
		
			update_0_3();
			time_source_start(time_source_update_0_3);
			time_source_start(time_source_update_0_3_2);
			time_source_start(time_source_update_stop_0_3);
		});
		time_source_start(time_source_border_delay);
		break;
}