event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
		create_border(battle_border.up - 35, battle_border.down + 20, battle_border.left + 40, battle_border.right + 40);
		pattern_instance = create_pattern(obj_pattern_slime_hands, {
			fist: obj_fist_nightmare_ice_cream,
			drop: obj_bullets_nightmare_ice_cream,
			slime: obj_slime_nightmare_ice_cream,
			fist_capture: obj_fist_capture_nightmare_ice_cream
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_bats, {
			tentacle: obj_tentacle_destroy_back_nightmare_ice_cream,
			creation: obj_creation_nightmare_ice_cream,
		});
	break;
	
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left , battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_nightmare, {
			bone: obj_bone_nightmare_ice_cream,
			bone_spinning: obj_bone_spinning_nightmare_ice_cream,
			slime: obj_slime_nightmare_ice_cream,
		});
	break;
	
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_bones_and_drops, {
			bone:  obj_bone_nightmare_ice_cream,
			drop: obj_bullets_nightmare_ice_cream,
			tentacle: obj_tentacle_destroy_back_nightmare_ice_cream,
			slime: obj_slime_nightmare_ice_cream
		});
	break;
};
