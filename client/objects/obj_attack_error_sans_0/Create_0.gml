event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 4);
switch (type) {
	case 0:
		create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_falling_bones, {
			bone: obj_bone_sharp_error_sans,
			sides: [dir.up]
		});
		break;
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_poking_bones, {
			bone: obj_bone_sharp_error_sans
		});
		break;
	case 2:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_two_bones, {
			soul_type: battle_soul_type.red,
			bone: obj_bone_error_sans,
			bone_size: 5.4,
			side_is_changing: false
		});
		break;
	case 3:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_platforms_and_falling_bones, {
			bone: obj_bone_sharp_error_sans
		});
		break;
	case 4:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_flying_bones, {
			bone: obj_bone_error_sans,
			sides: [dir.left, dir.right],
			is_aiming: false,
			custom_bone_size: 1.4
		});
		break;
}