/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} action_id - index action
/// @return {String}
function fight_get_action_name(enemy_id, action_id) {
	return fight_get_enemy(enemy_id).actions[action_id].name;
}
