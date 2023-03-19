/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
function fight_reset_player_action(player_id) {
	global.fight_instance.player_action[player_id] = fight_action_type.empty;
}
