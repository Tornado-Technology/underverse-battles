event_inherited();

// Set mode
fight_network_mode = true;

// Required
required_components = {
	ui: obj_network_fight_ui,
	input: obj_network_fight_input,
	bg: obj_fight_background, 
	bgm: obj_fight_soundtrack, 
	timer: obj_network_fight_timer
};

on_into_fight.invoke(opponent_get_name(1));
