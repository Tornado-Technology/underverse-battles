function fight_get_state() {
	if (global.fight_instance == noone) {
		return fight_state.undefined;
	}
	
	return global.fight_instance.state;
}