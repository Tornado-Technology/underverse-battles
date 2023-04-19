/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} value
function fight_set_player_hp(player_id, value) {
	fight_get_player(player_id).hp = value;
}
