event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_scythe_small_aren, {
			scythe_small: obj_scythe_small_jevil	
		});
	break;
		
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_falling_scythe_aren, {
			scythe_falling: obj_scythe_falling_jevil	
		});
	break;

		
	default:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_scythe_aren, {
			scythe: obj_scythe_jevil	
		});
	break;
	
}