function fight_add_player_mana(player, mana){
	fight_get_player(player).mana += mana;
	fight_get_player(player).mana = clamp(fight_get_player(player).mana, 0, fight_get_player_max_mana(player));
	return true;
}