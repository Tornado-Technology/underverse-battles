event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_row_of_spinning_bones, {
			bone: obj_bone_papyrus,
			rotating_bone: obj_bone_rotating_papyrus
		});
	break;
	
	case 1:
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_patten_shooting_bones_and_platforms, {
			bone: obj_bone_papyrus
		});
	break;
	
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_three_little_platforms_and_bones, {
			bone: obj_bone_papyrus,
			rotating_bone: obj_bone_rotating_papyrus
		});
	break;
}