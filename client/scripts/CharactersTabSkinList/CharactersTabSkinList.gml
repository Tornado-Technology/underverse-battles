function CharactersTabSkinList(menu_instance, max_cell_in_horizontal) {
	var instance =  new ClassCharactersTabSkinList(menu_instance, max_cell_in_horizontal);
	return instance;
}

function ClassCharactersTabSkinList(menu_instance, max_cell_in_horizontal) : ClassCharactersTab(menu_instance) constructor {
	self.max_cell_in_horizontal = max_cell_in_horizontal;
	characters = [];
	character_frames = [];
	character_id = 0;
	static base_update = update;
	static base_draw = draw;
	static base_on_draw_cell = on_draw_cell;
	static base_on_click_on_character = on_click_on_character;
	
	// Overwrited in object
	static on_click_on_character = function(_id) {
		base_on_click_on_character(_id);
	}
	
	static on_draw_cell = function(array_x, array_y) {
		if (!instance_exists(menu_instance)) return;
		
		var character_skin_id = array_x + count_cell_horizontal * array_y;
		var rectangle_x = menu_instance.rec_x1;
		var rectangle_y = menu_instance.rec_y1;
		var frame_width = menu_instance.frame_width;
		var frame_height = menu_instance.frame_height;
		var offset_x = menu_instance.dist_x;
		var offset_y = menu_instance.dist_y;
		var top_shift = menu_instance.top_shift;
		var text_color_selected = menu_instance.text_name_character_color;
		
		draw_set_font(global._font_main_mini);
		draw_set_halign(fa_center);
		if (selected_character == character_skin_id) draw_set_color(text_color_selected);
		
		draw_text(rectangle_x + frame_width * array_x + offset_x * (array_x + 1) + frame_width / 2, rectangle_y + frame_height * (array_y + 1) + offset_x + offset_y * array_y + top_shift, characters[character_skin_id].skin_name);
		draw_reset();
		
		base_on_draw_cell(array_x, array_y);
	}
	
	static change_character = function(_id) {
		character_id = _id;
		characters = [];
		for (var i = 0; i < array_length(menu_instance.characters[_id]); i++) {
			characters[i] = menu_instance.characters[_id][i];
		}
		var count_characters = array_length(characters);
		self.count_cell_horizontal = count_characters > max_cell_in_horizontal ? max_cell_in_horizontal : count_characters;
		self.count_cell_vertical = ceil(count_characters / max_cell_in_horizontal);
		
		init();
	}
	
	static close = function() {
		change_selected_character(0, false);
		menu_instance.change_tab(characters_tab.characters);
	}
	
	static update = function() {	
		if (menu_instance.input_back) {
			audio_play_sound_plugging(snd_selection);
			close();
		}
		base_update();
	}
}