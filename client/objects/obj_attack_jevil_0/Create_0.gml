event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right  - 10);
		pattern_instance = create_pattern(obj_pattern_clubs_box);
	break;

	case 1:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right  - 10);
		pattern_instance = create_pattern(obj_pattern_clubs_box);
	break;
	
	case 2:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right  - 10);
		pattern_instance = create_pattern(obj_pattern_hearts_box);
	break;
	
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right );
	pattern_instance = create_pattern(obj_pattern_box);
	break;
	
	
	

}