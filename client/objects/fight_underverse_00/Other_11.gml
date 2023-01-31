/// @desc Death
var player_hp = fight_get_enemy_hp(0);

if (player_hp <= 0) {
	enemy_death_id = player_hp;
}

if (enemy_death_id == -1) exit;

memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.END_STATE, gameover.lose);

battle_death_animation = true;
