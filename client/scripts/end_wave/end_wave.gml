function end_wave() {
	instance_destroy(obj_battle);
	
	if (!fight_network_mode) {
		fight_set_state(fight_state.reset);
	}
}
