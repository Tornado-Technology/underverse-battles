sprite_index = noone;
global.fight_instance = id;

// Set mode
fight_network_mode = true;
story_mode = false;

// Required
required_components = {
	ui: obj_network_fight_ui,
	input: obj_network_fight_input,
	bg: obj_fight_background, 
	bgm: obj_fight_soundtrack,
	timer: obj_fight_timer
};

// Character
player_object[0] = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, obj_character_tornado);
player_object[1] = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, obj_character_tornado);

// Background
var bg_id = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.BACKGROUND_CUSTOM, 0);
background = background_get(background_info.sprite, bg_id);
background_obj = background_get(background_info.animator, bg_id);

// Soundtrack
var _soundtrack	= memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK);
var _soundtrack_custom = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM);

soundtrack = _soundtrack_custom;
if (_soundtrack_custom == undefined) {
	soundtrack = _soundtrack;
}

// Other
x_shift = 1;
time = 0;
battle_ends = false;
player_death_id = -1;


// Next
// Main create
player = [noone, noone];
player_can_input = [true, true];
player_action = [-1, -1];
player_power = [0, 0];

// initiative 
var buffer = global.fight_network_buffer_initiative;
initiative = buffer == undefined ? 0 : buffer;
buffer = undefined;

// State
state = fight_state.choosing;

// Position
center_player_position_x = [room_width / 6, room_width / 1.2];
center_player_position_y = [room_height / 1.5, room_height / 1.5];

// Timer
time = 0;

// Dev
pause = false;
_time = 0;

#region Methods
players_chosen = function() {
	return player_action[0] == -1 || player_action[1] == -1;
}

players_defended = function() {
	return player_action[0] == player_action[1];
}

player_is_skipping = function() {
	return player_action[initiative] == fight_action_type.skip;
}
#endregion

// Setup obj_fight
alarm[1] = 1;

on_into_fight.invoke(opponent_get_name(1));
