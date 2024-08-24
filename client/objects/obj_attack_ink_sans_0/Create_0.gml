event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 22, battle_border.right - 22);
		pattern_instance = create_pattern(obj_pattern_ink_dripping_from_above, {
			drops: [obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_orange_ink_sans, obj_drop_black_ink_sans, obj_drop_blue_ink_sans, obj_drop_cyan_ink_sans]
		});
		break;
		
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_waterfall_ink_blast, {
				waterfall: [obj_drop_black_waterfall_ink_sans, obj_drop_orange_waterfall_ink_sans, obj_drop_cyan_waterfall_ink_sans, obj_drop_blue_waterfall_ink_sans]
		});
	
	break;
	
	default:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left - 25, battle_border.right - 25);
		pattern_instance = create_pattern(obj_pattern_ink_flying_from_sides, {
			drops: [obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_orange_ink_sans, obj_drop_cyan_ink_sans,
					obj_drop_black_ink_sans, obj_drop_black_ink_sans,
					obj_drop_blue_ink_sans,
					obj_drop_green_ink_sans]
		});
		break;
}