/// @desc Init
sprite_index = noone;
selected_action = 0;
selected_power = 0;

// Configuration
sound_select = snd_selection;
sound_click = snd_click;

// Utils
can_select = true;
can_skip = true;

input_ability = false;

set_selected_action = function(_id) {
	selected_action = _id;
	audio_play_sound(sound_click, 0, false);
}

set_action_power = function() {
	fight_set_enemy_power(0, selected_power);
	fight_set_enemy_action(0, selected_action);
}

confirm_action_and_power = function() {
	if (!can_select) return;
	
	// Idk it's so stupid
	var can_select_condition_1 = fight_get_enemy_stamina(0) >= fight_get_enemy_action_stamina_cost(0, selected_action);
	var can_select_condition_2 = fight_get_initiative() == 1;
	
	// Can select if wa have some stamina or if we dodging
	if (can_select_condition_1 || can_select_condition_2) {
		set_action_power();
	}
	
	selected_action = 0;
	selected_power = 0;
	audio_play_sound(sound_select, 0, false);
}

skip = function() {
	selected_action = 3;
	selected_power = 0;
	set_action_power();

	selected_action = 0;
	selected_power = 0;
	audio_play_sound(sound_select, 0, false);
}