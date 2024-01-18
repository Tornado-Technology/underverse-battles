function end_wave() {
	instance_destroy(obj_battle);
	fight_set_state(fight_state.reset);
}
