///@desc Инк - Про уворот

if (fight_get_player_action(0) > 0) {
	fight_set_player_action(0, -1);
	
	dlg = dialog_create(episode + "WrongAttack");
	
	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	/* Next scenario */
	scenario = 7;
	exit;
}

if (fight_get_player_action(0) == 0) {
	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	fight_set_pause(false);
	fight_update_state();
	
	start_delay();
}

if (_delay == 30) {
	dlg = dialog_create(episode + "Dialog6");

	/* Next scenario */
	scenario = 9;
	
	/* Pause Delay */
	pause_delay();
}