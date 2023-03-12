function fight_player_add_special_action_percent(player_id) {
	var player = fight_get_player(player_id);
	player.special_action.percent += player.special_action.percent_given;
	if (player.special_action.percent > 100)
		player.special_action.percent = 100;
}