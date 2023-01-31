/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} value
function fight_remove_enemy_hp(enemy_id, value) {
	fight_get_enemy(enemy_id).hp -= value;
}
