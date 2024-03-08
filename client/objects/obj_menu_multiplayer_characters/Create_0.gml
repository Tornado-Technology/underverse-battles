event_inherited();

obj_selected_character = noone;
is_switch_menu_pause = false;
is_cliked = false;

tabSkin.on_click_on_character = function() {
	if (is_cliked) return;
	
	is_cliked = true;
	tabSkin.base_on_click_on_character();
	var selected_character = characters[tabCharacters.selected_character][tabSkin.selected_character];
	obj_selected_character = selected_character.object;
	
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, obj_selected_character);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK, selected_character.statistics.soundtrack);
	
	input_lock = true;
	
	effect_fade(0.5, 0, c_black, c_black, true, -1, function() {
		send_fight_join(tournament_mode ? match_type.tournament_1vs1 : match_type.rating_1vs1,
			tabCharacters.selected_character, tabSkin.selected_character);
		instance_create(obj_menu_matchmaking);
		instance_destroy();
	});
	
	audio_play_sound_plugging(snd_selection);
	audio_stop_sound(obj_menu.menu_soundtrack_current);

	is_switch_menu_pause = true;
}