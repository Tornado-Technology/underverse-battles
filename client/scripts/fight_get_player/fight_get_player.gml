/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
function fight_get_player(player_id) {
	return global.fight_instance.player[player_id];
}
