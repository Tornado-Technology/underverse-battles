function fight_get_player_special_action_icon(player_id, locked = false){
	if (locked)
		return fight_get_player(player_id).special_action.icon_locked;
	return fight_get_player(player_id).special_action.icon;
}