event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 2);
switch (type) {
	case 0:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_aiming_gasterblasters, {
			gasterblaster_aiming: obj_gasterblaster_aiming_sans
		});
		break;
	case 1:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_crossed_gasterblasters, {
			gasterblaster: obj_gasterblaster_sans
		});
		break;
	case 2:
		create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_gasterblasters_with_platforms, {
			bone: obj_bone_sans,
			gasterblaster: obj_gasterblaster_sans
		});
		break;
}