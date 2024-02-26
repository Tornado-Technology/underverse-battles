event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 25, battle_border.right - 25);
		pattern_instance = create_pattern(obj_pattern_ink_dripping_from_above);
		break;
	default:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 25, battle_border.right - 25);
		pattern_instance = create_pattern(obj_pattern_ink_flying_from_sides);
		break;
}