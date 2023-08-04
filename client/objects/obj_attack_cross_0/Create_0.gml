event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 5);
switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_getting_out_bones, {
			bone: obj_bone_topref_cross
		});
		break;
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_flying_bones, {
			bone: obj_bone_topref_cross,
			sides: [dir.left, dir.right]
		});
		break;
	case 2:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_flying_bones, {
			bone: obj_bone_topref_cross,
			sides: [dir.left, dir.right]
		});
		break;
}