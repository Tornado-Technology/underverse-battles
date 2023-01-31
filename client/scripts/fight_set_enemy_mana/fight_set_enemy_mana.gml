function fight_set_enemy_mana(enemy, mana){
	fight_get_enemy(enemy).mana = mana;
	return true;
}