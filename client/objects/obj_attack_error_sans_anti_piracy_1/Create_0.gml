event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_strings_and_bones, {
			bone: obj_bone_sharp_error_sans_anti_piracy,
			thread: obj_string_error_sans_anti_piracy
		});
		break;
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_three_strings, {
			bone: obj_bone_sharp_error_sans_anti_piracy,
			thread: obj_string_error_sans_anti_piracy
		});
		break;
}