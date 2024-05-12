event_inherited();

selected_characters = [noone, noone];

top_shift = 20;

soundtrack = undefined;

// Text
text_your_char = translate_get("CharactersDescription.SelectYourCharacter");
text_enemy_char = translate_get("CharactersDescription.SelectEnemyCharacter");

tabSkin = tabs[characters_tab.skins];
tabCharacters = tabs[characters_tab.characters];

tabCharacters.tab_to_transfer = characters_tab.skins;

tabSkin.on_click_on_character = function() {
	tabSkin.base_on_click_on_character();
	var selected_character = characters[tabCharacters.selected_character][tabSkin.selected_character];
	
	tabSkin.close();
	
	if (selected_characters[0] == noone) {
		selected_characters[0] = selected_character.object;
		sprite_target = spr_character_frame_target2;
		text_name_character_color = c_aqua;
		tabCharacters.get_frame(tabCharacters.selected_character).image_default_alpha = 0.5;
		return;
	}
	
	selected_characters[1] = selected_character.object;
	
	//input_lock = true;
	
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, selected_characters[0]);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, selected_characters[1]);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK, selected_character.statistics.soundtrack);
	
	var transition_time = 0.4;
	effect_fade(transition_time, 0, transition_time, c_black, true, -1, function() {
		room_goto(room_fight);
		instance_destroy();
	});
	
	audio_play_sound_plugging(snd_selection);
	audio_stop_sound(obj_menu.menu_soundtrack_current);

	is_switch_menu_pause = true;
}