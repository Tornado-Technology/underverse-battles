event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(3, 3);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bone_and_spikes_from_sides, {
			bone: obj_bone_nightmare,
			spike: obj_spike_pushing_nightmare
		});
	break;
	
	case 1:
		create_border(battle_border.up , battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_tentacles_three, {
			thread_tentacles: obj_string_tentacles_nightmare,
			spike: obj_spike_1_nightmare
		});	
	break; 
	
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_spwan_tentacles, {
			bomb: obj_spaw_timer_tentacles_nightmare,
			spike: obj_spike_1_nightmare
		});
	break;
	
	case 3:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_spikes_flies_up, {
			spike: obj_spike_nightmare,
			spike_timer: obj_spike_times_nightmare
		});
	break;
};
