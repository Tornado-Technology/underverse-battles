event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = irandom_range(0, 3);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_and_spikes_from_sides, {
			bone: obj_bone_green,
			spike: obj_spear_green
		});
		break;
	case 1:
		create_border(battle_border.up - 25, battle_border.down - 25, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_duplet_spikes, {
			spike: obj_spear_green
		});
		break;
	case 2:
		var border_decrease = 40;
		create_border(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		pattern_instance = create_pattern(obj_pattern_moving_arena, {
			spike: obj_spear_green
		});
		break;
	case 3:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 45, battle_border.right - 45);
		pattern_instance = create_pattern(obj_pattern_poking_bones_from_sides, {
			bone: obj_bone_green,
			sides: [dir.left, dir.right]
		});
		break;
}