/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {Real}
function fight_get_player_max_hp(player_id) {
	return fight_get_player(player_id).max_hp;
}
