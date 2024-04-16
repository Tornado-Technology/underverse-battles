if (!sans_met_xchara && sans.x >= room_width - 480) {
	cutscene_create(cutscenes[1]);
	sans_met_xchara = true;
}

if (fight_position_event) {
	ink_sans.x = lerp(ink_sans.x, fight_underverse_00.center_player_position_x[0], 0.1);
	ink_sans.y = lerp(ink_sans.y, fight_underverse_00.center_player_position_y[0] - 40, 0.1);
	xchara.x = lerp(xchara.x, fight_underverse_00.center_player_position_x[1], 0.1);
	xchara.y = lerp(xchara.y, fight_underverse_00.center_player_position_y[1] - 40, 0.1);
	sans.x = lerp(sans.x, fight_underverse_00.center_player_position_x[0] - 30, 0.1);
	sans.y = lerp(sans.y, ink_sans.y + 10, 0.1);
	
	xchara.image_xscale = -1;
}

if (scene_position_event) {
	soul_sans.x = lerp(soul_sans.x,  room_width - 400, 0.1);
	soul_sans.y = lerp(soul_sans.y, room_height - 50, 0.1);
	xchara.x = lerp(xchara.x,  room_width - 270, 0.1);
	xchara.y = lerp(xchara.y, room_height - 50, 0.1);
	sans.x = lerp(sans.x, room_width - 380, 0.1);
	sans.y = lerp(sans.y, room_height - 40, 0.1);
}

if (scenario <= 15)
	event_user(scenario);
else if (scenario == 16) {
	if (fight_get_state() != fight_state.choosing)
		exit;

	dlg = dialog_create(episode + "Dialog10");
			
	/* Options */
	fight_set_pause(false);

	/* Next scenario */
	scenario = 17;
}
else if (scenario == 17) {
	if (instance_exists(dlg))
		exit;
	
	/* Fight */
	fight_set_initiative(0);
	fight_set_player_stamina(0, 0);
				
	/* Options */
	fight_set_ui_showing_action_box(true);
	fight_set_player_input(true);
	fight_set_pause(true);
	
	fight_ui_set_player_can_input_skip(true);

	/* Next scenario */
	scenario = 18;
}
else if (scenario == 18) {
	if (fight_get_player_attack(0) >= 0) {
		dlg = dialog_create(episode + "WrongSkip");
		
		fight_reset_player_action(0);
	
		/* Options */
		fight_ui_set_player_can_input_skip(false);
		fight_set_ui_showing_action_box(false);
		fight_set_player_input(false);
		fight_set_pause(true);
	
		/* Next scenario */
		scenario = 17;
	}
	else {
		if (fight_get_player_is_skipping(0)) {
			/* Options */
			fight_ui_set_player_can_input_skip(false);
			fight_set_ui_showing_action_box(false);
			fight_set_player_input(false);
			fight_set_pause(false);
			fight_update_state();
			
			start_delay();
		}
	}

	if (_delay == 30) {
		dlg = dialog_create(episode + "Dialog11");

		/* Next scenario */
		scenario = 19;
	
		/* Pause Delay */
		pause_delay();
	}
}
else if (scenario == 19) {
	if (instance_exists(dlg))
		exit;
	
	/* Fight */
	fight_set_initiative(1);
				
	/* Options */
	fight_ui_set_player_can_input_skip(true);
	fight_set_ui_showing_action_box(true);
	fight_set_player_input(true);
	fight_set_pause(false);
	timer_switch(true);
	timer_start();

	/* Next scenario */
	scenario = 20;
}
else if (scenario == 20) {
	if (fight_get_initiative() == 0) {
		scenario = 21;
	}
}
else if (scenario == 21) {
	if (!instance_exists(fight_underverse_00))
		exit;
	if (fight_get_initiative() == 1) {
		/* Options */
		fight_ui_set_player_can_input_skip(false);
		fight_set_ui_showing_action_box(false);
		fight_set_player_input(false);
		
		start_delay();
	}
	
	if (_delay == 30) {
		instance_destroy(fight_underverse_00);
		
		player_.sprite_index = spr_char_sans_idle;
		ink_sans_.sprite_index = spr_char_ink_sans_attack_finish;
		xchara_.sprite_index = spr_xchara_defeated;
		
		dlg = dialog_create(episode + "Dialog12");
		dlg.shift = 0;
		
		/* Next scenario */
		scene_position_event = true;
		
		pause_delay();
	}
}
else if (scenario == 22) {
	if (dlg.cur_num == 6) {
		audio_play_sound_plugging(snd_healing);
		scenario = 23;
	}
}
else if (scenario == 23) {
	if (dlg.cur_num == 7) {
		xchara_.sprite_index = spr_xchara_teleported;
		audio_play_sound_plugging(snd_swing);
		alarm[2] = 20;
		scenario = 24;
	}
}
else if (scenario == 24) {
	if (instance_exists(dlg))
		exit;
		
	effect_fade(2, 0, 0, c_black, true, 0);
	
	alarm[1] = 120;
	
	scenario = 25;
}