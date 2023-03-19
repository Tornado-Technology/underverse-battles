/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {Bool}
function fight_get_player_is_skipping(player_id) {
	var action_type = global.fight_instance.player_action[player_id];
	if (action_type == fight_action_type.skip) return true;
	return false;
}