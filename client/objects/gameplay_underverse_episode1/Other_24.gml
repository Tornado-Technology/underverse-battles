///@desc Инк - Уворот не засчитывается

if (fight_get_player_action(0) >= 0) {
	dlg = dialog_create(episode + "Dialog9", dir.down);
	
	/* Fight */
	if (fight_get_player_action(0) <= 1)
		fight_set_player_action(1, 1 - fight_get_player_action(0));
	else
		fight_set_player_action(1, 0);
	
	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	fight_set_pause(true);
	
	/* Next scenario */
	scenario = 15;
}