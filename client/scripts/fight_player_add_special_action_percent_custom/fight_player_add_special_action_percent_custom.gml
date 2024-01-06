function fight_player_add_special_action_percent_custom(player_id, percent) {
	var player = fight_get_player(player_id);
	player.special_action.percent += percent;
	if (player.special_action.percent > 100)
		player.special_action.percent = 100;
}