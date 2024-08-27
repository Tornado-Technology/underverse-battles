event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_with_platforms, {
			bone: obj_bone_papyrus,
			bone_spinning: obj_bone_spinning_papyrus
		});
	break;
	
	case 1:
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_patten_bone_moving_platform, {
			bone: obj_bone_papyrus
		});
	break;
	
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left - 5, battle_border.right - 5);
		pattern_instance = create_pattern(obj_pattern_spinning_attack_bone, {
			bone: obj_bone_rotating_papyrus,
			bone_shaking: obj_bone_shaking_papyrus
		});
	break;
}