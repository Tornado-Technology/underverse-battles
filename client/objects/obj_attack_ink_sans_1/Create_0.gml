event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 1);
switch (type) {
	case 0:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_broomie_waving, {
			max_acceleration: 8
		});
		break;
	case 1:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_broomie_spining_and_moving, {
			max_acceleration: 18
		});
		break;
}