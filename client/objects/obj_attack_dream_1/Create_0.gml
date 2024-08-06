event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
	create_border(battle_border.up - 45, battle_border.down - 45, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_intersecting_blades, {
			blades_swing: obj_blade_dream,
			blades_moving_y: obj_blade_moving_parabolas_dream
		});
	break;
	
	case 1:
	create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_directions_blades, {
			blades_swing: obj_blade_dream
		});
	break;
	
	case 2:
	create_border(battle_border.up - 55, battle_border.down - 55, battle_border.left - 55, battle_border.right - 55);
		pattern_instance = create_pattern(obj_pattern_blade_in_center, {
			blades_swing: obj_blade_dream
		});	
	break;
	
	default:
	create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_spinning_blades, {
			blades_swing: obj_blade_dream
		});
	break;
}