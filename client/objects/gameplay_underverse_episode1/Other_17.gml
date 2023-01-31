///@desc Первая атака

if (instance_exists(dlg))
	exit;

/* Fight */
fight_set_enemy_action(1, 3);
fight_set_initiative(0);
				
/* Options */
fight_set_ui_showing_action_box(true);
fight_set_player_input(true);
fight_set_pause(true);

/* Next scenario */
scenario = 8;