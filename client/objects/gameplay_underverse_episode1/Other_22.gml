///@desc Инк - Повторный уворот

if (fight_get_enemy_action(0) >= 0 and fight_get_enemy_power(0) == 0) {
	fight_set_enemy_action(0, -1);
	
	dlg = dialog_create(episode + "WrongPower");
	
	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	fight_set_pause(true);
	
	/* Next scenario */
	scenario = 11;
	exit;
}

if (fight_get_enemy_action(0) != -1 && fight_get_enemy_action(0) != 3) {
	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	fight_set_pause(false);
	fight_update_state();
	
	start_delay();
}

if (_delay == 30) {
	dlg = dialog_create(episode + "Dialog8");

	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);

	/* Next scenario */
	scenario = 13;
	
	/* Pause Delay */
	pause_delay();
}