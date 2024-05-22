function CharactersTabSkinList(menu_instance, max_cell_in_horizontal) {
	var instance =  new ClassCharactersTabSkinList(menu_instance, max_cell_in_horizontal);
	return instance;
}

function ClassCharactersTabSkinList(menu_instance, max_cell_in_horizontal) : ClassCharactersTab(menu_instance) constructor {
	self.max_cell_in_horizontal = max_cell_in_horizontal;
	characters = [];
	character_frames = [];
	character_id = 0;
	is_hover_on_button = false;
	static color_selected = c_yellow;
	static button_offset_x = 20;
	static button_offset_y = 15;
	static base_init = init;
	static base_update = update;
	static base_draw = draw;
	static base_on_draw_cell = on_draw_cell;
	static base_on_click_on_character = on_click_on_character;
	
	button_close = new UITextButton(0, menu_instance.text.back)
		.set_padding(5)
		.set_on_press(function() {
			close();
		});
	
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
	
	static init = function() {
		button_close.text_hover_color = color_selected;
		
		base_init();
	}
	
	static close = function() {
		selected_character = 0;
		
		audio_play_sound_plugging(snd_selection);
		menu_instance.input_enter = 0;
		menu_instance.change_tab(characters_tab.characters);
	}
	
	static update = function() {
		if (menu_instance.input_back) {
			close();
			return;
		}
		
		if (menu_instance.input_vertical != 0) {
			var new_id = selected_character + count_cell_horizontal * menu_instance.input_vertical
			
			if (new_id >= array_length(character_frames)) {
				is_hover_on_button = true;
				button_close.focus();
				hide_selection();
				audio_play_sound_plugging(snd_click);
			} else if(is_hover_on_button) {
				is_hover_on_button = false;
				menu_instance.input_vertical = 0;
				button_close.unfocus();
				show_selection();
				audio_play_sound_plugging(snd_click);
			}
		}
		
		if (!is_hover_on_button) {
			base_update();
		}
		
		if (menu_instance.input_enter && button_close.is_focus) {
			button_close.on_press();
		}
	}
	
	static draw = function() {
		base_draw();
		
		var offset_x = menu_instance.dist_x;
		var offset_y = menu_instance.dist_y;
		var frame_height = menu_instance.frame_height;
		var top_shift = menu_instance.top_shift;
		
		var position_x = (menu_instance.rec_x1 + menu_instance.rec_x2) / 2;
		var position_y = menu_instance.rec_y1 + frame_height * count_cell_vertical + offset_y * count_cell_vertical + top_shift + button_offset_y;
		
		button_close.draw(position_x, position_y);
	}
}