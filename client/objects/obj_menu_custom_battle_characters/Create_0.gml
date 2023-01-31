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
	
	input_lock = true;
	
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, selected_characters[0]);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, selected_characters[1]);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK, selected_character.statistics.soundtrack);
	
	effect_fade(1, 0, c_black, c_black, true, -1);
	
	audio_play_sound_plugging(snd_selection);
	
	room_goto(room_fight);
	instance_destroy();
}