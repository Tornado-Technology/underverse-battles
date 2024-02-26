event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_getting_out_bones, {
			bone: obj_bone_topref_cross
		});
		break;
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_flying_bones, {
			bone: obj_bone_topref_cross,
			sides: [dir.left, dir.right],
			is_aiming: false
		});
		break;
	case 2:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_bone_shelling, {
			bone: obj_bone_topref_cross
		});
		break;
	default:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_two_rows_of_platforms, {
			bone: obj_bone_cross,
			gasterblaster_aiming: obj_gasterblaster_aiming_cross
		});
		break;
}