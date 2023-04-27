event_inherited();

//Story mode
story_mode = true;

// Required
required_components = {
	ui: obj_fight_ui,
	input: obj_fight_input,
	bgm: obj_fight_soundtrack, 
	timer: obj_fight_timer, 
	uv: obj_ai
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

// Instance create
event_user(1);