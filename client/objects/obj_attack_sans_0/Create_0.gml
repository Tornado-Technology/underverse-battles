event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 4);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_wave, {
			bone: obj_bone_sans
		});
		break;
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_jumping_over_bones, {
			bone: obj_bone_sans
		});
		break;
	case 2:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_two_bones, {
			bone: obj_bone_sans,
			bone_size: 5.4
		});
		break;
	case 3:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_two_rows_of_platforms, {
			bone: obj_bone_sans,
			gasterblaster_aiming: obj_gasterblaster_aiming_sans
		});
		break;
	case 4:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_shift_and_jumping_over_bones, {
			bone: obj_bone_sans
		});
		break;
}