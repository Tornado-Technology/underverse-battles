function fight_set_player_skip(_player_id, force = false){
	global.fight_instance.player_action[_player_id] = fight_action_type.skip;
	
	// Call update method
	if (!force) {
		fight_update_state();
	}
}