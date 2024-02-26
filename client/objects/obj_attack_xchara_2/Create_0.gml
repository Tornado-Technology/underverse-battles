event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 1);
switch (type) {
	case 0:
		create_border(battle_border.up - 30 - _power * 2, battle_border.down - 30 - _power * 2, battle_border.left - 30 - _power * 2, battle_border.right - 30 - _power * 2);
		pattern_instance = create_pattern(obj_pattern_damage_zone_full, {
			damage_zone: obj_damage_zone_warning_xchara
		});
		break;
	default:
		create_border(battle_border.up - 60, battle_border.down - 60, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_damage_zone_line, {
			damage_zone: obj_damage_zone_warning_xchara
		});
		break;
}