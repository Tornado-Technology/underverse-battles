event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack, {
			bone: obj_bone_sans,
			use_gravity_attack: use_gravity_attack,
			is_double: fight_random_choose(true, false)
		});
		break;
		
	case 1:
		if (use_gravity_attack) {
			create_border(battle_border.up - 30, battle_border.down, battle_border.left + 20, battle_border.right + 20);
		} else {
			create_border(battle_border.up - 60, battle_border.down - 30, battle_border.left + 20, battle_border.right + 20);
		}
		pattern_instance = create_pattern(obj_patten_two_bone_holes_two_type, {
			bone: obj_bone_sans,
			use_gravity_attack: use_gravity_attack
		});
	break;
		
	default:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_with_platforms, {
			bone: obj_bone_sans,
			use_gravity_attack: use_gravity_attack
		});
		break;
}