///@desc Усилить атаку

if (instance_exists(dlg)) {
	if (dlg.cur_num == 6) {
		if (!instance_exists(obj_bar_power))
			instance_create_depth(room_width - 320, room_height / 2, 0, obj_bar_power);
	}
}

if (instance_exists(dlg))
	exit;
	
/* Fight */
fight_set_enemy_action(1, 3);
fight_set_initiative(0);
				
/* Options */
bar_power_disappearance();
fight_set_ui_showing_action_box(true);
fight_set_ui_showing_action_box_power(true);
fight_set_player_input(true);
fight_set_pause(true);
			
/* Next scenario */
scenario = 12;