event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 1);
switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_gasterblaster, {
			gasterblaster: obj_gasterblaster_cross,
			gasterblaster_aiming: obj_gasterblaster_aiming_cross,
			use_gravity_attack: use_gravity_attack,
			is_double: choose(true, false)
		});
		break;
	case 1:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_blue_attack_gasterblaster_with_platforms, {
			gasterblaster: obj_gasterblaster_cross,
			gasterblaster_aiming: obj_gasterblaster_aiming_cross,
			use_gravity_attack: use_gravity_attack
		});
		break;
}