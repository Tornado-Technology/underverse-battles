/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {Bool}
function fight_player_using_special_action(player_id) {
	return global.fight_instance.player_action[player_id] == fight_action_type.special_attack;
}