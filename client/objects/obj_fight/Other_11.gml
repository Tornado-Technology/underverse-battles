/// @desc Death
var enemys_hp = [fight_get_enemy_hp(0), fight_get_enemy_hp(1)];

for (var i = 0; i < array_length(enemys_hp); i++) {
	var enemy_hp = enemys_hp[i];
	
	if (enemy_hp <= 0) {
		enemy_death_id = i;
	}
}

if (enemy_death_id == -1) exit;

memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.END_STATE, enemy_death_id == 0 ? gameover.lose :  gameover.win);

battle_death_animation = true;
