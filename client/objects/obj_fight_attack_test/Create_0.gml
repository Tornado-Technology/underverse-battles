event_inherited();

// Required
required_components = {
	ui: obj_fight_ui_test,
	input: obj_fight_input_test
};

initiative = 0;

selected_character = 0;
selected_skin = 0;

player_object[0] = global.characters[0, 0].object;
player_object[1] = obj_character;

type = 0;