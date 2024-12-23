event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_aiming_gasterblasters, {
			soul_type: battle_soul_type.red,
			gasterblaster_aiming: obj_gasterblaster_aiming_fell_sans,
			count: fight_random_integer(1, 2)
		});
		break;
	case 1:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_crossed_gasterblasters, {
			gasterblaster: obj_gasterblaster_fell_sans
		});
		break;
	case 2:
		create_border(battle_border.up, battle_border.down, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_big_two_rows_of_bones, {
			bone: obj_bone_fell_sans,
			gasterblaster: obj_gasterblaster_fell_sans
		});
	break;
	
	default:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 43, battle_border.right - 43);
		pattern_instance = create_pattern(obj_pattern_gasterblasters_from_above, {
			bone: obj_bone_fell_sans,
			gasterblaster: obj_gasterblaster_fell_sans
		});
		break;
}