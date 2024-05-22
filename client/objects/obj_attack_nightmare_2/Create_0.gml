event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
		create_border(battle_border.up - 35, battle_border.down + 20, battle_border.left + 15, battle_border.right + 5);
		pattern_instance = create_pattern(obj_pattern_fist_tentacles, {
			fist: obj_fist_nightmare,
			platform: obj_spinning_platform,
			slime: obj_slime_nightmare,
			fist_capture: obj_fist_capture_nightmare
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_creation_trident, {
			creation: obj_creation_nightmare
		});
	break;
	
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left , battle_border.right);
		pattern_instance = create_pattern(obj_patterns_bone_nightmare, {
			bone:  obj_bone_nightmare,
			bone_spinning: obj_bone_spinning_nightmare
		});
	break;
	
	case 3:
	create_border(battle_border.up, battle_border.down, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_patterns_wave_slime_nightmare, {
			bone:  obj_bone_nightmare,
			bone_spinning: obj_bone_spinning_nightmare,
			tentacles: obj_tentacles_destroy_back_nightmare,
			slime: obj_slime_nightmare
		});
	break;
	
	case 4:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_spinning_aren_1, {
			slime:  obj_slime_nightmare
		});
	break;
	
	case 5:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_fist_his, {
			fist_his:  obj_fist_his_nightmare
		});
	break;
	
	
	default:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_pattern_spinning_aren, {
			tentacles_tremble: obj_tentacles_tremble_nightmare,
			bullets: obj_bullets_nightmare
		});
	break;
};
