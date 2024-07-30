event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_broomie_waving, {
			brush: obj_brush_ink_sans,
			max_acceleration: 8
		});
		break;
		
	case 1:
		create_border(battle_border.up - 10, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_broomie_drawing, {
			brush: obj_brush_drawing_ink_sans,
			max_acceleration: 10
		});
	break;
		
	case 2:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_broomie_spining_and_moving_1, {
			brush: obj_brush_thrown_out_ink_sans,
			max_acceleration: 18
		});
	break;
		
	default:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_broomie_spining_and_moving, {
			brush: obj_brush_ink_sans,
			max_acceleration: 18
		});
		break;
}