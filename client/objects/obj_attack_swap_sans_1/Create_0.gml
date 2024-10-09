event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_spining_crossed_bones, {
			rotating_bone: obj_bone_rotating_swap_sans
		});
		break;
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_spining_bones_in_center, {
			rotating_bone: obj_bone_rotating_swap_sans
		});
		break;
	default:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_spining_bones, {
			rotating_bone: obj_bone_rotating_swap_sans
		});
		break;
}