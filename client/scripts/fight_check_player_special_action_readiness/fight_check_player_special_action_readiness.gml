function fight_check_player_special_action_readiness(player_id){
	if (fight_get_player_special_action_percent(player_id) == 100)
		return true;
	return false;
}