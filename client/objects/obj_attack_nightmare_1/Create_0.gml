event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_and_spikes_from_sides, {
			bone: obj_spike_nightmare,
			spike: obj_spike_pushing_nightmare
		});
	break;
	
	case 1:
		create_border(battle_border.up , battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_tentacles_three, {
			thread_tentacles: obj_string_tentacles_nightmare,
			spike:  obj_spike_nightmare
		});	
	break; 
	
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_spwan_tentacles, {
			bomb: obj_bomb_grow_tentacles_nightmare,
			spike:  obj_spike_nightmare
		});
	break;
	
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_spikes_flies_up, {
			spike: obj_spike_nightmare
		});
	break;
};
