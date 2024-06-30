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
	
	case 1:
	var border = 10;
	create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
	pattern_instance = create_pattern(obj_pattern_bullet_radiun_1);
	break;
	
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right );
	pattern_instance = create_pattern(obj_pattern_bullet_teleport);
	break;
	
	
	default:
	var border = 30;
	create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
	pattern_instance = create_pattern(obj_pattern_bullet_border);
	break;
	
	
	

}