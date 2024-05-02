event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch(type) {
	case 0:
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_patten_bone_moving_platform, {
			bone: obj_bone_papyrus,
			bone_blue: obj_bone_blue_changes_papyrus
		});
	break;
	
	case 1:
	create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_directing_bones_and_blue_form_right, {
			bone: obj_bone_changes_papyrus,
			bone_blue: obj_bone_blue_changes_papyrus
		});
	break;
	
	case 2:
		create_border(battle_border.up - 40, battle_border.down, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_patten_blue_bone_moving, {
			bone: obj_bone_changes_papyrus,
			bone_blue: obj_bone_blue_changes_papyrus
		});

	break;
	
	
	default:
	create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_directing_bones_and_blue_form_right, {
			bone: obj_bone_changes_papyrus,
			bone_blue: obj_bone_blue_changes_papyrus
		});
	break;

};