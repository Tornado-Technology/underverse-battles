event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch(type) {
	case 0:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left + 40, battle_border.right + 40);
		pattern_instance = create_pattern(obj_patten_blue_bone_moving, {
			bone: obj_bone_papyrus,
			bone_blue: obj_bone_blue_papyrus
		});
	break;
	
	case 1:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left + 40, battle_border.right + 40);
		pattern_instance = create_pattern(obj_patten_two_bone_holes_blue_bone_moving, {
			bone: obj_bone_papyrus,
			blue_bone: obj_bone_blue_papyrus
		});
	
	break;
		
	default:
	create_border(battle_border.up - 35, battle_border.down - 35, battle_border.left + 50, battle_border.right + 50);
		pattern_instance = create_pattern(obj_pattern_directing_bones_and_blue_form_right, {
			bone: obj_bone_changes_papyrus,
			bone_blue: obj_bone_blue_changes_papyrus
		});
	break;

};