event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_four_bones, {
			bone: obj_bone_fell_sans,
			use_gravity_attack: use_gravity_attack
		});
		break;
		
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_bone_different_sizes, {
			bone: obj_bone_fell_sans,
			use_gravity_attack: use_gravity_attack
		});
		break;
		
		
	default:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_two_rows_of_bones, {
			bone: obj_bone_fell_sans,
			use_gravity_attack: use_gravity_attack
		});
		break;
}