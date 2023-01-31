/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
function fight_reset_enemy_action(enemy_id) {
	fight_set_enemy_action(enemy_id, -1, true);
}
