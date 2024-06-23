event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch(type) {

	case 0:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_wings_1, {
			wings: obj_wings_xanastasia
		});	
	
	break;
	
	
	default:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_wings_1, {
			wings: obj_wings_xanastasia
		});	
	break;
	
}