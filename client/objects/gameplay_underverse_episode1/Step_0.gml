if (delay_working)
	_delay++;

if (fight_position_event) {
	ink_sans_.x = lerp(ink_sans_.x, fight_underverse_00.center_player_position_x[0], 0.1);
	ink_sans_.y = lerp(ink_sans_.y, fight_underverse_00.center_player_position_y[0] - 40, 0.1);
	xchara_.x = lerp(xchara_.x, fight_underverse_00.center_player_position_x[1], 0.1);
	xchara_.y = lerp(xchara_.y, fight_underverse_00.center_player_position_y[1] - 40, 0.1);
	player_.x = lerp(player_.x, fight_underverse_00.center_player_position_x[0] - 30, 0.1);
	player_.y = lerp(player_.y, ink_sans_.y + 10, 0.1);
	
	xchara_.image_xscale = -1;
	
	if (ink_sans_.x < fight_underverse_00.center_player_position_x[0] + 0.1) {
		alarm[0] = 30;
		fight_position_event = false;
	}
}

if (scene_position_event) {
	ink_sans_.x = lerp(ink_sans_.x,  room_width - 400, 0.1);
	ink_sans_.y = lerp(ink_sans_.y, room_height - 50, 0.1);
	xchara_.x = lerp(xchara_.x,  room_width - 270, 0.1);
	xchara_.y = lerp(xchara_.y, room_height - 50, 0.1);
	player_.x = lerp(player_.x, room_width - 380, 0.1);
	player_.y = lerp(player_.y, room_height - 40, 0.1);
	
	if (ink_sans_.x > room_width - 400 - 0.1) {
		scenario = 22;
		scene_position_event = false;
	}
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
	if (fight_get_player_action(0) >= 0) {
		dlg = dialog_create(episode + "WrongSkip");
		
		fight_reset_player_action(0);
	
		/* Options */
		fight_ui_set_player_can_input_skip(false);
		fight_set_ui_showing_action_box(false);
		fight_set_player_input(false);
		fight_set_pause(true);
		
		disable_mobile_ui();
	
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
			
			enable_mobile_ui();
			
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
	
	enable_mobile_ui();

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
		
		bg_disappearance(obj_bg_deltarune);
		
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
		
	effect_fade(2, 0, c_black, c_black, true, 0);
	
	alarm[1] = 120;
	
	scenario = 25;
}