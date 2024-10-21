event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_slime_hands, {
			fist: obj_fist_nightmare,
			drop: obj_drop_nightmare,
			slime: obj_slime_nightmare,
			fist_capture: obj_fist_capture_nightmare
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_bats, {
			tentacle: obj_tentacle_destroy_back_nightmare,
			creation: obj_creation_nightmare
		});
	break;
	
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left , battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_nightmare, {
			bone: obj_bone_nightmare,
			bone_spinning: obj_bone_spinning_nightmare,
			slime: obj_slime_nightmare,
		});
	break;
	
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_bones_and_drops, {
			bone: obj_bone_nightmare,
			drop: obj_drop_nightmare,
			tentacle: obj_tentacle_destroy_back_nightmare,
			slime: obj_slime_nightmare
		});
	break;
}
