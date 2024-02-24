menu_switch_pause(true);
disable_all_constructor_ui_buttons();

width = display_get_gui_width();
height = display_get_gui_height();

// Menu
obj_menu.is_make_blackout = true;
obj_menu.is_make_logo_open = true;

input_lock = false;

// Rectange
rec_x1 = width / 3;
rec_y1 = 0;
rec_x2 = width;
rec_y2 = height;
rec_line_size = 1;

// Distantion
dist_frame = sprite_get_width(spr_character_frame);
dist_x = 5;
dist_y = 5;

frame_width = sprite_get_width(spr_character_frame);
frame_height = sprite_get_height(spr_character_frame);

// Characters
characters = global.characters;
character = undefined;
character_animation_frame = 0;
char_num = array_length(characters);

// Animation
time_source_character_animation = time_source_create(time_source_game, 10, time_source_units_frames, function() {
	character_animation_frame += 1;
	
	if (character == undefined) character_animation_frame = 0;
	
	if (character_animation_frame >= sprite_get_number(character.statistics.idle_animation)) {
		character_animation_frame = 0
	}
}, [], -1);
time_source_start(time_source_character_animation);

table_char_max_x = 6;

// Target
sprite_target = spr_character_frame_target1;
text_name_character_color = c_yellow;
imange_target_time = 0;
imange_target_period = 30;
imange_target_num = 0; 

character = undefined;

top_shift = 0;

input_back = 0;
input_enter = 0;
input_vertical = 0;
input_held_vertical = 0;
input_horizontal = 0;
input_wheel = 0;

text = {
	back: translate_get("Menu.StandardButtons.Back"),
	attacks: translate_get("CharactersDescription.Attacks"),
	description: translate_get("CharactersDescription.Description"),
	char_list: translate_get("CharactersDescription.CharactersList"),
	hp: translate_get("CharactersDescription.HP"),
	sp: translate_get("CharactersDescription.SP"),
	damage: translate_get("CharactersDescription.Damage"),
	karma: translate_get("CharactersDescription.Karma"),
	regeneration: translate_get("CharactersDescription.Regeneration"),
	stamines: translate_get("CharactersDescription.Stamines"),
	creator: translate_get("CharactersDescription.Creator"),
	soundtrack: translate_get("CharactersDescription.Soundtrack"),
}

audio_play_sound_plugging(snd_selection);

enum characters_tab {
	characters,
	description,
	skins
}

tabs = [];

tabs[characters_tab.characters] = CharactersTabList(id, char_num, table_char_max_x);
tabs[characters_tab.skins] = CharactersTabSkinList(id, table_char_max_x);
tabs[characters_tab.description] = CharactersTabDescription(id);

change_tab = function(_id) {
	tab_id = _id;
}

get_tab = function(_id) {
	return tabs[_id];
}

change_tab(characters_tab.characters);
