/// @desc Set new action for enemy_id, also call update state
/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} value - new action for enemy
/// @param {Bool} force - if true don't call fight_update_state()
function fight_set_enemy_action(_enemy_id, _value, force = false){
	global.fight_instance.enemy_action[_enemy_id] = _value;
	
	// Call update method
	if (!force) {
		fight_update_state();
	}
}
