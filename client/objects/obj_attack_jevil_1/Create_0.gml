event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		var border = 20;
		create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
		pattern_instance = create_pattern(obj_pattern_bullet_radiun, {
			clubs: obj_bullet_clubs_timer_jevil
		});
		break;
	
	case 1:
		var border = 30;
		create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
		pattern_instance = create_pattern(obj_pattern_diamonds_bullet, {
			diamonds: obj_diamonds_bullet_jevil
		});
		break;
	
	case 2:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bullet_teleport, {
			teleport: obj_teleport_jevil	
		});
		break;
	
	default:
		var border = 30;
		create_border(battle_border.up - border, battle_border.down - border, battle_border.left - border, battle_border.right - border);
		pattern_instance = create_pattern(obj_pattern_bullet_border, {
			clubs: obj_bullet_clubs_jevil	
		});
		break;
}