/// @desc Set new action for player_id, also call update state
/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} value - new action for player
/// @param {Bool} force - if true don't call fight_update_state()
function fight_set_player_action(_player_id, _value, force = false){
	global.fight_instance.player_action[_player_id] = _value + fight_action_type.attack_1;
	
	// Call update method
	if (!force) {
		fight_update_state();
	}
}
