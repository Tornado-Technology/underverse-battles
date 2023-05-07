function CharactersTabList(menu_instance, count_characters, max_count_frame_in_horizontal) {
	var instance =  new ClassCharactersTabList(menu_instance, count_characters, max_count_frame_in_horizontal);
	instance.init();
	return instance;
}

function ClassCharactersTabList(menu_instance, count_characters, max_count_frame_in_horizontal) : ClassCharactersTab(menu_instance) constructor {
	self.count_cell_horizontal = max_count_frame_in_horizontal;
	self.count_cell_vertical = ceil(count_characters / max_count_frame_in_horizontal);
	self.menu_instance = menu_instance;
	characters = [];
	character_frames = [];
	tab_to_transfer = characters_tab.description;
	is_hover_on_button = false;
	static color_selected = c_yellow;
	static button_offset_x = 20;
	static button_offset_y = 30;
	static base_init = init;
	static base_update = update;
	static base_draw = draw;
	static base_on_draw_cell = on_draw_cell;
	static base_on_click_on_character = on_click_on_character;
	
	button_close = UITextButton(menu_instance.text.back, function() {
		close();
	});
	
	static on_click_on_character = function(_id) {
		menu_instance.get_tab(tab_to_transfer).change_character(_id);
		menu_instance.change_tab(tab_to_transfer);
		base_on_click_on_character(_id);
	}
	
	static on_draw_cell = function(array_x, array_y) {
		var character_id = array_x + count_cell_horizontal * array_y;
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
		if (selected_character == character_id) draw_set_color(text_color_selected);
		
		draw_text(rectangle_x + frame_width * array_x + offset_x * (array_x + 1) + frame_width / 2, rectangle_y + frame_height * (array_y + 1) + offset_x + offset_y * array_y + top_shift, characters[character_id].name);
		draw_reset();
		
		base_on_draw_cell(array_x, array_y);
	}
	
	static init = function() {
		for (var i = 0; i < array_length(menu_instance.characters); i++) {
			characters[i] = menu_instance.characters[i][0];
		}
		menu_instance.character = characters[0];
		
		button_close.text_hover_color = color_selected;
		
		base_init();
	}
	
	static close = function() {
		audio_play_sound_plugging(snd_selection);
		instance_destroy(menu_instance);
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
			} else if(is_hover_on_button) {
				is_hover_on_button = false;
				menu_instance.input_vertical = 0;
				button_close.unfocus();
			}
		}
		
		if (!is_hover_on_button) {
			base_update();
		}
		
		if (menu_instance.input_enter && button_close.is_focus) {
			button_close.press();
		}
	}
	
	static draw = function() {
		base_draw();
		
		var rectangle_x = menu_instance.rec_x1;
		var rectangle_y = menu_instance.rec_y1;
		var offset_x = menu_instance.dist_x;
		var offset_y = menu_instance.dist_y;
		var frame_height = menu_instance.frame_height;
		var top_shift = menu_instance.top_shift;
		
		var position_y = rectangle_y + frame_height * count_cell_vertical + offset_y * count_cell_vertical + top_shift + button_offset_y;
		
		button_close.draw(rectangle_x + offset_x + button_offset_x, position_y);
	}
}