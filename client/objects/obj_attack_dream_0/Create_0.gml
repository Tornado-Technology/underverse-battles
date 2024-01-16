event_inherited();

on_border_created = function() {
	pattern_instance.callback();
};

type = irandom_range(0, 3);

switch (type) {
	case 0 :	
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_star_spawn_in_aren, {
			star : obj_star_dream	
		});
	break;
	
	case 1 :
		create_border(battle_border.up + 20, battle_border.down + 20, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_directing_star_from_left_and_right, {
			star_spinning : obj_star_spinning_dream
		});
	break;
	
	case 2 :
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right - 10)
		pattern_instance = create_pattern(obj_pattern_big_star_inside_soul, {
			big_star : obj_big_star_dream,
			star : obj_star_dream
		});
	break;
	
	case 3:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_staff_star_waving, {
			max_acceleration: 12
		});
	break;
	
};