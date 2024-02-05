///@desc Инк - Усиление

if (fight_get_player_attack(0) > -1) {
	fight_set_player_action(1, fight_get_player_attack(0));
	
	/* Options */
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	fight_set_pause(false);
	fight_update_state();
	
	start_delay();
}

if (_delay == 30) {
	dlg = dialog_create(episode + "Dialog7");
	
	/* Next scenario */
	scenario = 11;
	
	/* Pause Delay */
	pause_delay();
}