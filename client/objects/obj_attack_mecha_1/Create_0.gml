event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
		create_border(battle_border.up , battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_tentacles_three, {
			thread_tentacles: obj_string_tentacles_nightmare_mecha,
			spike:  obj_spike_nightmare_mecha
		});	
	break; 
	
	case 1:
	create_border(battle_border.up, battle_border.down, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_spwan_tentacles, {
			bomb: obj_bomb_grow_tentacles_nightmare_mecha,
			spike:  obj_spike_nightmare_mecha
		});
	break;
	
	default:
	create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left - 15, battle_border.right - 15);
		pattern_instance = create_pattern(obj_pattern_spikes_flies_up, {
			spike: obj_spike_nightmare_mecha,
			spike_target: obj_spike_target_nightmare_mecha
		});
	break;
};
