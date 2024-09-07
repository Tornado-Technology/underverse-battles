event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_wave, {
			bone: obj_bone_fell_sans
		});
		break;
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_directing_bones_from_left_and_right, {
			spining_bone: obj_bone_spinning_fell_sans
		});
		break;
	case 2:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_two_bones, {
			soul_type: battle_soul_type.red,
			bone: obj_bone_fell_sans,
			bone_size: 4.2,
			side_is_changing: false
		});
		break;
	case 3:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_directing_bones_from_upper_corners, {
			spining_bone: obj_bone_spinning_fell_sans
		});
		break;
	case 4:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_shift_and_jumping_over_bones, {
			bone: obj_bone_fell_sans
		});
		break;
	default:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_platform_moves_through_bones, {
			bone: obj_bone_fell_sans
		});
		break;
}