/// @desc Set special action for player_id, also call update state
/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Bool} force - if true don't call fight_update_state()
function fight_set_player_special_action(player_id, force = false){
	//if (!fight_check_player_special_action_readiness(0)) { return; }

	global.fight_instance.player_action[player_id] = fight_action_type.special_attack;
	global.fight_instance.player[player_id].special_action.percent = 0;

	// Call update method
	if (!force) {
		fight_update_state();
	}
}