event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch(type) {
	case 0:
	var border = 10;
	create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
	pattern_instance = create_pattern(obj_pattern_bullet_radiun);
	break;
	
	
	default:
	var border = 20
	create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
	pattern_instance = create_pattern(obj_pattern_bullet_border);
	break;
	
	
	

}