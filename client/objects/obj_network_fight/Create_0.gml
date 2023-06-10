event_inherited();

// Set mode
fight_network_mode = true;

first_reset_was = false;

// Required
required_components = {
	ui: obj_network_fight_ui,
	input: obj_network_fight_input,
	bg: obj_fight_background, 
	bgm: obj_fight_soundtrack, 
	timer: obj_network_fight_timer
};

// Ending room
ending_room = room_fight_1v1_end;

on_into_fight.invoke(opponent_get_name(1));
send_fight_loaded();