sprite_index = noone;
global.fight_instance = id;

// Set mode
fight_network_mode = false;
story_mode = false;

// Required
required_components = {
	ui: obj_fight_ui,
	input: obj_fight_input,
	bg: obj_fight_bg, 
	bgm: obj_fight_bgm, 
	timer: obj_fight_timer, 
	ai: obj_ai
};

// Character
enemy_object[0] = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, char_tornado);
enemy_object[1] = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, char_tornado);

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
battle_continues = true;
battle_death_animation = false;
enemy_death_id = -1;

// Discord
if (is_desktop) discord_set_info_action(discord_action.in_fight);

// Next
// Main create
enemy = [noone, noone];
enemy_can_input = [true, true];
enemy_action = [-1, -1];
enemy_power = [0, 0];

// initiative 
initiative = 0;

// State
state = fight_state.choosing;

// Position
center_enemy_position_x = [room_width / 6, room_width / 1.2];
center_enemy_position_y = [room_height / 1.5, room_height / 1.5];

// Timer
time = 0;

// Dev
pause = false;
_time = 0;

// Ending room
ending_room = room_fight_end;

#region Some useful methods
function fight_enemys_chosen() {
	return enemy_action[0] == -1 || enemy_action[1] == -1;
}

function fight_enemys_defended() {
	return enemy_action[0] == enemy_action[1];
}

function fight_enemy_skip() {
	return enemy_action[initiative] == 3;
}

function fight_enemy_action_is_attack() {
	var type = fight_get_enemy_action_type(initiative, enemy_action[initiative]);
	return type == fight_action_type.attack || type == fight_action_type.attack_with_healing;
}
#endregion

// Setup obj_fight
alarm[1] = 1;
