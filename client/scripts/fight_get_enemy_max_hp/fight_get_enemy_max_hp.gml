/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @return {Real}
function fight_get_enemy_max_hp(enemy_id) {
	return fight_get_enemy(enemy_id).max_hp;
}
