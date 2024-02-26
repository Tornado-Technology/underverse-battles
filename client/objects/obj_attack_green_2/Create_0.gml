event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		var random_border_index = irandom_range(0, 2);
		if (random_border_index == 0)
			create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (random_border_index == 1)
			create_border(battle_border.up - 5, battle_border.down - 5, battle_border.left - 35, battle_border.right - 35);
		if (random_border_index == 2)
			create_border(battle_border.up - 35, battle_border.down - 35, battle_border.left - 5, battle_border.right - 5);
		pattern_instance = create_pattern(obj_pattern_solo_aiming_gasterblaster, {
			soul_type: battle_soul_type.red,
			gasterblaster_aiming: obj_turboblaster_aiming_green
		});
		break;
	case 1:
		create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_solo_aiming_gasterblaster_with_rows_of_bones, {
			soul_type: battle_soul_type.red,
			gasterblaster_aiming: obj_turboblaster_aiming_green,
			bone: obj_bone_green
		});
		break;
	default:
		create_border(battle_border.up - 85, battle_border.down - 45, battle_border.left - 50, battle_border.right - 50);
		pattern_instance = create_pattern(obj_pattern_solo_gasterblaster_from_above, {
			soul_type: battle_soul_type.red,
			gasterblaster: obj_turboblaster_green,
			distance: 60,
		});
		break;
}