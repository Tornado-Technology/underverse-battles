event_inherited();

on_border_created = function () {
	pattern_instance.callback();
}

switch(type) {
	case 0:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_circle_swords, {
			feathers: obj_feathers_xanastasia,
			swords: obj_swords_xanastasia
		});	
	
	break;
	
	case 1:
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_random_spawns_swords, {
			swords: obj_swords_xanastasia
		});	
	break;
	
	case 2:
	create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_small_arena_swords, {
			swords: obj_swords_xanastasia
		});	
	break;
	
	case 3:
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_feathers_swords, {
			swords: obj_swords_xanastasia,
			feathers: obj_feathers_xanastasia
		});	
	
	break;
	
	default:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_hit_swords, {
			feathers: obj_feathers_xanastasia,
			aim_hit: obj_aim_hit
		});	
	break;
	
}