event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_strings_from_all_sides, {
			bone: obj_bone_sharp_error_sans,
			thread: obj_thread_error_sans
		});
		break;
	default:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_three_strings, {
			bone: obj_bone_sharp_error_sans,
			thread: obj_thread_error_sans
		});
		break;
}