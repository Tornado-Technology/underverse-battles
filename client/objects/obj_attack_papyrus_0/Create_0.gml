event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(3, 3);
switch(type) {
	case 0:
		create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_platform_mover_through_spining_bone, {
			bone : obj_bone_spinning_papyrus,
			spining_bone: obj_bone_spinning_papyrus,
			bone_spinning : obj_bone_rotating_papyrus
		});
	break;
	case 1: 
		create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_directing_bones_and_blue_form_right, {
			bone: obj_bone_spinning_papyrus,
			bone_blue: obj_bone_blue_papyrus
		});
	case 2: 
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_jumping_over_bones, {
			bone: obj_bone_papyrus
		});
	case 3: 
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_jumping_over_bones_with_blue_bones, {
			bone: obj_bone_papyrus,
			blue_bone: obj_bone_blue_papyrus
		});
	break;
	


};