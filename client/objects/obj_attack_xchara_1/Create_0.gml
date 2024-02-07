event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 2);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_damage_wave_to_target, {
			damage_wave: obj_damage_wave_xchara
		});
		break;
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_damage_wave_to_center, {
			damage_wave: obj_damage_wave_xchara
		});
		break;
	case 2:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_pattern_damage_wave_warning, {
			damage_wave: obj_damage_wave_xchara,
			zone_damage_wave: obj_zone_damage_wave
		});
		break;
}