function fight_add_player_mana(player_id, mana){
	fight_get_player(player_id).mana += mana;
	fight_get_player(player_id).mana = clamp(fight_get_player(player_id).mana, 0, fight_get_player_max_mana(player_id));
	return true;
}