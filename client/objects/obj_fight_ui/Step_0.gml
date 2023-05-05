event_user(0); // Line Step

if (fight_player_selecting(0)) {
	
	channel_position = approach(channel_position, 0, channel_speed);
	var precent = animcurve_channel_evaluate(channel_action_box_start_y, channel_position);

} else {
	
	channel_position = approach(channel_position, 1, channel_speed);
	var precent = animcurve_channel_evaluate(channel_action_box_end_y, channel_position);
}
action_box_position.y = action_box_position_start.y + (action_box_position_end.y - action_box_position_start.y) * precent;

// Initiative string 
str_initiative = translate_get(fight_get_initiative() == 0 ? "Battle.YoureAttacking" : "Battle.YoureDodging");

// Change special attack image
special_button.set_image(fight_check_player_special_action_readiness(0) ?
	fight_get_player_special_action_icon(0) : fight_get_player_special_action_icon(0, true)
);
