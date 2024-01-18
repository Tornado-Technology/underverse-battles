/// @desc Inks
_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Капли падают сверху
		_border = battle_border_create(battle_border.up-25, battle_border.down-25, battle_border.left-25, battle_border.right-25);

		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red, fight_network_mode);
		
			update_0_0();
			time_source_start(time_source_update_0_0);
			time_source_start(time_source_update_destroy_0_0);
		});
		time_source_start(time_source_border_delay);
		break;
	
	case 1: // Капли летят сбоку
		_border = battle_border_create(battle_border.up - 25, battle_border.down - 25, battle_border.left - 15, battle_border.right - 15);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red, fight_network_mode);
		
			update_0_1(_power);
			time_source_start(time_source_update_0_1);
			time_source_start(time_source_update_destroy_0_1);
		});
		time_source_start(time_source_border_delay);
		break;
}