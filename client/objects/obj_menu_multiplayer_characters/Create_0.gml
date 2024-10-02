event_inherited();

obj_selected_character = noone;
is_switch_menu_pause = false;
is_cliked = false;

if (!variable_instance_exists(id, "is_private_fight")) is_private_fight = false;

tabSkin.on_click_on_character = function() {
	if (is_cliked) return;
	
	is_cliked = true;
	tabSkin.base_on_click_on_character();
	var selected_character = characters[tabCharacters.selected_character][tabSkin.selected_character];
	obj_selected_character = selected_character.object;
	
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, obj_selected_character);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK, selected_character.statistics.soundtrack);
	
	input_lock = true;
	
	var transition_time = 0.4;
	effect_fade(transition_time, 0, transition_time, c_black, true, true, function() {
		if (is_private_fight) {
			send_private_fight_join(tabCharacters.selected_character, tabSkin.selected_character);
			instance_create(obj_menu_matchmaking, {
				is_private: is_private_fight
			});
		} else {
			var match_mode = get_match_type();
			send_fight_join(get_match_type(), tabCharacters.selected_character, tabSkin.selected_character);
			instance_create(obj_menu_matchmaking, {
				match_mode: match_mode,
				is_private: is_private_fight
			});
		}
		instance_destroy();
	});
	
	audio_play_sound_plugging(snd_selection);
	audio_stop_sound(obj_menu.menu_soundtrack_current);

	is_switch_menu_pause = true;
}

get_match_type = function() {
	if (tournament_mode) {
		return match_type.tournament_1vs1;
	}
	return data_get("Game.RatingMode") ? match_type.rating_1vs1 : match_type.common_1vs1;
}