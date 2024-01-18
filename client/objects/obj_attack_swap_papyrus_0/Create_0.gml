event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 3);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_full_length_bones, {
			bone: obj_bone_swap_papyrus
		});
		break;
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bones_and_orange_bones, {
			bone: obj_bone_swap_papyrus,
			orange_bone: obj_bone_orange_swap_papyrus
		});
		break;
	case 2:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_bones_coming_out_of_walls, {
			bone: obj_bone_swap_papyrus
		});
		break;
	case 3:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_two_bones, {
			soul_type: battle_soul_type.orange,
			bone: obj_bone_swap_papyrus,
			bone_size: 5.4,
			side_is_changing: true
		});
		break;
}