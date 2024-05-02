event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch(type) {
	case 0:
		create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_platform_mover_through_spining_bone, {
			bone: obj_bone_papyrus,
			spining_bone: obj_bone_spinning_papyrus,
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_platform_mover_through_changes_bone, {
			bone: obj_bone_changes_papyrus
		});
	break;
		
	case 2:
	create_border(battle_border.up + 10, battle_border.down, battle_border.left + 20, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_spinning_aren_four_bone, {
			bone: obj_bone_papyrus,
			changes_bone: obj_bone_changes_papyrus
		});
	break;
	
	
	case 3:
		create_border(battle_border.up + 10, battle_border.down, battle_border.left + 20, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_spinning_rondom_bone, {
			bone: obj_bone_papyrus,
			changes_bone: obj_bone_changes_papyrus
		});

	break;
	
		
	default:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_jumping_over_changes_bones, {
			bone: obj_bone_changes_papyrus,
		});
	break;

};