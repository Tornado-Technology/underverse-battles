/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {Real}
function fight_get_player_action(player_id) {
	return global.fight_instance.player_action[player_id];
}