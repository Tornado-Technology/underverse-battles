event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch (type) {
	case 0:
		create_border(battle_border.up - 35, battle_border.down + 20, battle_border.left + 15, battle_border.right + 5);
		pattern_instance = create_pattern(obj_pattern_fist_tentacles, {
			fist: obj_fist_nightmare,
			platform: obj_spinning_platform,
			slime: obj_slime_nightmare,
			fist_capture: obj_fist_capture_nightmare
		});
	break;
	
	
	default:
	//create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
	//	pattern_instance = create_pattern(obj_pattern_spikes_flies_up, {
	//		spike: obj_spike_nightmare,
	//		spike_timer: obj_spike_times_nightmare
	//	});
		
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_pattern_spinning_aren, {
			
		});
	break;
};
