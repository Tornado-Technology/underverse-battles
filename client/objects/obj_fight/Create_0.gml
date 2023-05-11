sprite_index = noone;
global.fight_instance = id;

// Set mode
fight_network_mode = false;
story_mode = false;

// Set camera
camera_set_position(0, 0);

// Required
required_components = {
	ui: obj_fight_ui,
	input: obj_fight_input,
	bg: obj_fight_background, 
	bgm: obj_fight_soundtrack, 
	timer: obj_fight_timer, 
	ai: obj_ai
};

// Character
player_ammount = 2;
you = 0;
_opponent = 1;

player_object[0] = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, obj_character_tornado);
player_object[1] = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, obj_character_tornado);

center_player_position_x = [room_width / 6, room_width / 1.2];
center_player_position_y = [room_height / 1.5, room_height / 1.5];

for (var player_id = 0; player_id < player_ammount; player_id++) {
	player_can_input[player_id] = true;
	player_action[player_id] = fight_action_type.empty;
	player_power[player_id] = 0;
}

// initiative 
initiative = 0;

// Turn
turn = 0;

// Time source
end_battle_timesource = 0;

// Other
x_shift = 1;

// Discord
if (is_desktop) discord_set_info_action(discord_action.in_fight);

// State
state = fight_state.choosing;

// Dev
pause = false;
_time = 0;

// Ending room
ending_room = room_fight_end;

// Background
background_id = undefined;

// Soundtrack
soundtrack = undefined;

#region Methods
player_are_selecting = function(player_id) {
	if (player_action[player_id] != fight_action_type.empty)
		return false;
	return true;
}

players_are_selecting = function() {
	for (var player_id = 0; player_id < player_ammount; player_id++) {
		if (player_action[player_id] == fight_action_type.empty)
			return true;
	}
	return false;
}

set_next_initiative = function(){
	initiative = 1 - initiative;
}

set_next_turn = function(){
	turn++;
}

player_is_acting = function(player_id) {
	return player_action[player_id] == fight_action_type.attack1 ||
		player_action[player_id] == fight_action_type.attack2 ||
		player_action[player_id] == fight_action_type.attack3;
}

player_is_special_acting = function(player_id) {
	return player_action[player_id] == fight_action_type.special_attack;
}

player_is_skipping = function(player_id) {
	return player_action[player_id] == fight_action_type.skip;
}

players_dodged = function(player_id1, player_id2) {
	return player_action[player_id1] == player_action[player_id2];
}

reset_players_action = function () {
	for (var player_id = 0; player_id < player_ammount; player_id++) {
		player_action[player_id] = fight_action_type.empty;
		player_power[player_id] = 0;
	}
}

check_player_lose = function() {
	if (player[you].is_defeated() || player[_opponent].is_defeated())
		finish_battle();
}

finish_battle = function () {
	fight_set_ui_showing_action_box(false);
	fight_set_player_input(false);
	timer_stop();
	fight_set_pause(true);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.END_STATE, player[you].defeated ? gameover.lose :  gameover.win);
	time_source_start(end_battle_timesource);
	instance_destroy(obj_battle);
	audio_stop_all();
}

goto_ending_room = function() {
	global.fight_instance = noone;
	room_goto(ending_room);
}
#endregion