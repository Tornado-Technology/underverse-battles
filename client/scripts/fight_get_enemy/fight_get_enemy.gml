/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
function fight_get_enemy(enemy_id) {
	return global.fight_instance.enemy[enemy_id];
}
