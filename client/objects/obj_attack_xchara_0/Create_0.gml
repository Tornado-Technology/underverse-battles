event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_directing_knives, {
			knife: obj_knife_spin_xchara
		});
		break;
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_directing_knife_blast, {
			knife_blast: obj_knife_blast_xchara
		});
		break;
	case 2:
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_knives_from_sides, {
			knife: obj_knife_directed_xchara,
			sides: [dir.left, dir.right]
		});
		break;
	case 3:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
		pattern_instance = create_pattern(obj_pattern_knife_circle, {
			knife: obj_knife_directed_xchara
		});
		break;
}