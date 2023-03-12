/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
function fight_call_special_attack(player_id) {
	var player = fight_get_player(player_id);
	player.special_action.invoke(player, 0);
}