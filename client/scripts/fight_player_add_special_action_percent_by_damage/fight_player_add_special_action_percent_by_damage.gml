function fight_player_add_special_action_percent_by_damage(player_id, damage){
	var player = fight_get_player(player_id);
	player.special_action.percent += damage;
	if (player.special_action.percent > 100)
		player.special_action.percent = 100;
}