event_inherited();

//Story mode
story_mode = true;

// Required
required_components = {
	ui: obj_fight_ui,
	input: obj_fight_input,
	bg: obj_fight_bg, 
	bgm: obj_fight_bgm, 
	timer: obj_fight_timer, 
	uv: obj_ai_uv00
};

// CHARActer
enemy_object[0] = char_ink_sans;
enemy_object[1] = char_xchara_uv00;

// Background
var bg_id = _background.deltarune_battle;
background = background_get(background_info.sprite, bg_id);
background_obj = background_get(background_info.animator, bg_id);

/* Position */
center_enemy_position_x[0] = obj_camera.camera_position.x + obj_camera.view_width / 6;
center_enemy_position_x[1] = obj_camera.camera_position.x + obj_camera.view_width / 1.2;
center_enemy_position_y[0] = obj_camera.camera_position.y + obj_camera.view_height / 1.5;
center_enemy_position_y[1] = obj_camera.camera_position.y + obj_camera.view_height / 1.5;

// Soundtrack
soundtrack = snd_megalovania;

// Ending room
ending_room = room_menu;
