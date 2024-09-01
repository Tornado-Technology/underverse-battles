event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up-30, battle_border.down-20, battle_border.left-50, battle_border.right-50);
		pattern_instance = create_pattern(obj_pattern_accelerating_feathers, {
			feathers: obj_accelerating_feathers_xanastasia
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_falling_feathers, {
			feathers: obj_falling_feathers_xanastasia
		});
	break;

	case 2:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_feathers, {
			feathers: obj_feathers_xanastasia
		});
	break;

	case 3:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_around_soul_feathers, {
			feathers: obj_feathers_radius_xanastasia
		});

	break;

	default:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_pattern_wings_feathers, {
			wings: obj_wings_xanastasia,
			feathers:  obj_feathers_xanastasia
		});	
	break;
}