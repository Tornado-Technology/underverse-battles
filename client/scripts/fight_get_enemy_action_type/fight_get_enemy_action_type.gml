/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} action_id - index action
/// @return {Real}
function fight_get_enemy_action_type(enemy_id, action_id) {
	return global.fight_instance.enemy[enemy_id].actions[action_id].type;
}
