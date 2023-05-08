///@desc Атака Икс Чары

if (instance_exists(dlg))
	exit;
	
/* Options */
fight_set_ui_showing_action_box(true);
fight_set_player_input(true);
fight_set_pause(false);
fight_update_state();
	
/* Next scenario */
scenario = 16;