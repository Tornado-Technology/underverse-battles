/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {Real}
function fight_get_player_action(player_id) {
	var action_type = global.fight_instance.player_action[player_id];
	if (action_type == fight_action_type.attack1) return 0;
	if (action_type == fight_action_type.attack2) return 1;
	if (action_type == fight_action_type.attack3) return 2;
	return -1;
}