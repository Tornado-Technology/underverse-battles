event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(0, 1);
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
	pattern_instance = create_pattern(obj_pattern_curve_bone, {
		bone_curve : obj_bone_curve_papyrus	
	})
	break;

	//case 2 :
	//create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
	//pattern_instance = create_pattern(obj_pattern_rotating_bone, {
	//	 bone_rotating : obj_bone_line_papyrus	
	//})
	//break;
	
	//case 3 :
	//create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
	//pattern_instance = create_pattern(obj_pattern_rotating_bone, {
	//	 bone_rotating : obj_bone_changing_papyrus	
	//})
	//break;
	
	//case 4 :
	//	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
	//	pattern_instance = create_pattern(obj_pattern_jumping_over_changing_bones, {
	//		bone: obj_bone_papyrus,
	//		bone_changing : obj_bone_changing_papyrus
	//	});
	
	
	//break;
};