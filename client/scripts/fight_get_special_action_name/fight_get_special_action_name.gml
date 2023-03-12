/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {String}
function fight_get_special_action_name(player_id) {
	return fight_get_player(player_id).special_action.name;
}
