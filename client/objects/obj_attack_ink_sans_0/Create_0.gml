event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 25, battle_border.right - 25);
		pattern_instance = create_pattern(obj_pattern_ink_dripping_from_above, {
			drops: [obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
					obj_drop_black_ink_sans, obj_drop_black_ink_sans,
					obj_drop_blue_ink_sans,
					obj_drop_green_ink_sans]
		});
		break;
	case 1:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 25, battle_border.right - 25);
		pattern_instance = create_pattern(obj_pattern_ink_dripping_from_above_2_phase, {
			drops: [obj_drop_blue_ink_sans, obj_drop_blue_ink_sans, obj_drop_blue_ink_sans, obj_drop_blue_ink_sans,
					obj_drop_blue_ink_sans, obj_drop_blue_ink_sans, obj_drop_blue_ink_sans, obj_drop_blue_ink_sans,
					obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_green_ink_sans],
			drops_2_phase: [obj_drop_ink_sans]
		});
		break;
	default:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 25, battle_border.right - 25);
		pattern_instance = create_pattern(obj_pattern_ink_flying_from_sides, {
			drops: [obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
					obj_drop_black_ink_sans, obj_drop_black_ink_sans,
					obj_drop_blue_ink_sans,
					obj_drop_green_ink_sans]
		});
		break;
}