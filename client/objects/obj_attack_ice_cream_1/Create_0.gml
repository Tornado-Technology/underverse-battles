event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
		create_border(battle_border.up , battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_rotating_tentacle, {
			thread_tentacles: obj_rotating_tentacle_nightmare_ice_cream,
			spike:  obj_spike_nightmare_ice_cream
		});	
	break; 
	
	case 1:
	create_border(battle_border.up, battle_border.down, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_two_tentacle_bombs, {
			bomb: obj_bomb_grow_tentacles_nightmare_ice_cream,
			spike:  obj_spike_nightmare_ice_cream
		});
	break;
	
	default:
	create_border(battle_border.up - 15, battle_border.down - 15, battle_border.left - 15, battle_border.right - 15);
		pattern_instance = create_pattern(obj_pattern_spikes_and_tentacles, {
			spike: obj_spike_nightmare_ice_cream,
			tentacles: obj_tentacle_destroy_back_nightmare_ice_cream
		});
	break;
};
