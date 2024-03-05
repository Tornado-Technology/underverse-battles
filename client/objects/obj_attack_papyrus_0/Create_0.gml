event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = fight_random_integer(0, 0);
switch(type) {
	case 0 :
		create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_platform_mover_through_spining_bone, {
			bone : obj_bone_papyrus,
			spining_bone: obj_bone_spinning_papyrus,
			bone_spinning : obj_bone_rotating_papyrus
		});
	break;
	case 1 : 
		create_border(battle_border.up + 10, battle_border.down, battle_border.left, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_directing_bones_and_blue_form_right, {
			bone: obj_bone_papyrus,
			bone_blue : obj_bone_blue_papyrus
		});
	break;
	


};