///@desc Первая атака Икс Чары

if (instance_exists(dlg)) {
	if (dlg.ui.current_index == 2) {
		if (!instance_exists(obj_bar_border_outline))
			instance_create_depth(room_width - 320, 25, 0, obj_bar_border_outline);
	}

	if (dlg.ui.current_index == 4) {
		if (instance_exists(obj_bar_border_outline))
			instance_destroy(obj_bar_border_outline);
	}
}

if (instance_exists(dlg))
	exit;
	
/* Fight */
fight_set_initiative(1);
fight_set_player_action(0, 3);
fight_set_player_action(1, irandom_range(0, 1));
				
/* Options */
fight_set_pause(false);

/* Next scenario */
scenario = 6;