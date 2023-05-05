event_inherited();

//Story mode
story_mode = true;

// Required
required_components = {
	ui: obj_fight_ui,
	input: obj_fight_input_episode2,
	bgm: obj_fight_soundtrack, 
	timer: obj_fight_timer, 
	ai: obj_ai_ink_sans_episode2
};

// CHARActer
player_object[0] = obj_character_error_sans;
player_object[1] = obj_character_ink_sans;

/* Position */
center_player_position_x[0] = obj_camera.camera_position.x + obj_camera.view_width / 6;
center_player_position_x[1] = obj_camera.camera_position.x + obj_camera.view_width / 1.2;
center_player_position_y[0] = obj_camera.camera_position.y + obj_camera.view_height / 1.5;
center_player_position_y[1] = obj_camera.camera_position.y + obj_camera.view_height / 1.5;

// Soundtrack
soundtrack = snd_brushwork;

// Ending room
ending_room = room_menu;

// Methods
check_player_lose = function() {
	if (player[you].is_defeated())
		finish_battle();
}

finish_battle = function() {
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	timer_stop();
	fight_set_pause(true);
	time_source_start(end_battle_timesource);
	instance_destroy(obj_battle);
	audio_stop_all();
}

goto_ending_room = function() {
	global.fight_instance = noone;
	gameplay_underverse_episode2.cutscene_after_death();
	instance_destroy();
}

// Instance create
event_user(1);