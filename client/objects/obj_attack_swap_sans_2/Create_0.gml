event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_aiming_gasterblasters, {
			soul_type: battle_soul_type.orange,
			gasterblaster_aiming: obj_gasterblaster_aiming_swap_sans,
			count: irandom_range(1, 2)
		});
		break;
	case 1:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_crossed_gasterblasters, {
			gasterblaster: obj_gasterblaster_swap_sans
		});
		break;
	case 2:
		create_border(battle_border.up - 35, battle_border.down - 35, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_gasterblasters_with_bone_rows, {
			bone: obj_bone_swap_sans,
			gasterblaster: obj_gasterblaster_swap_sans
		});
		break;
}