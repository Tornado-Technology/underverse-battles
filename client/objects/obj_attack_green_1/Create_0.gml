event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 1);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_strings_and_bones, {
			thread: obj_string_green,
			bone: obj_bone_green
		});
		break;
	case 1:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 45, battle_border.right - 45);
		pattern_instance = create_pattern(obj_pattern_three_strings, {
			thread: obj_string_green,
			bone: obj_bone_green
		});
		break;
}