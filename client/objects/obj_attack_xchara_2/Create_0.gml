event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 30 - _power * 2, battle_border.down - 30 - _power * 2, battle_border.left - 30 - _power * 2, battle_border.right - 30 - _power * 2);
		pattern_instance = create_pattern(obj_pattern_damage_zone_full, {
			damage_zone: obj_damage_zone_warning_xchara
		});
		break;
		
	case 1:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_damage_zone_with_knife, {
			damage_zone: obj_damage_zone_warning_xchara,
			knife: obj_knife_spin_xchara
		});
		break;
	
	case 2:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_damage_zone_moving_arena, {
			damage_zone: obj_damage_zone_warning_xchara
		});
		break;
	
	default:
		var vertical;
		if (fight_random_integer(0, 1)) {
			create_border(battle_border.up - 60, battle_border.down - 60, battle_border.left - 20, battle_border.right - 20);
			vertical = false;
		} else {
			create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 60, battle_border.right - 60);
			vertical = true;
		}
		
		pattern_instance = create_pattern(obj_pattern_damage_zone_line, {
			damage_zone: obj_damage_zone_warning_xchara,
			vertical: vertical
		});
		break;
}