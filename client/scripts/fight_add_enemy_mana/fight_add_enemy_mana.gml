function fight_add_enemy_mana(enemy, mana){
	fight_get_enemy(enemy).mana += mana;
	fight_get_enemy(enemy).mana = clamp(fight_get_enemy(enemy).mana, 0, fight_get_enemy_max_mana(enemy));
	return true;
}