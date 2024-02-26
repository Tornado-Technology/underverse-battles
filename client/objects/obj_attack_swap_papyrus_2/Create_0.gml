event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		var border_decrease = 25 + _power * 3;
		create_border(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		pattern_instance = create_pattern(obj_pattern_orange_attack, {
			bone: obj_bone_swap_papyrus,
			use_gravity_attack: use_gravity_attack,
			is_double: choose(true, false)
		});
		break;
	default:
		var border_decrease = 20;
		create_border(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		pattern_instance = create_pattern(obj_pattern_orange_attack_four_bones, {
			bone: obj_bone_swap_papyrus,
			use_gravity_attack: use_gravity_attack,
			is_double: choose(true, false)
		});
		break;
}