event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_scythes_come_back, {
			scythe: obj_scythe_xanastasia
		});	
	break;
	
	case 1:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_scythe_moves_left_right, {
			scythe: obj_scythe_xanastasia,
			feathers: obj_feathers_xanastasia
		});	
	break;
	
	default:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_scythe_in_center, {
			scythe: obj_scythe_xanastasia,
			feathers: obj_feathers_xanastasia
		});	
	break;

	
}