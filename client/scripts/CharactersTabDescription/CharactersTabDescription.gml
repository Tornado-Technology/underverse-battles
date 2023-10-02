function CharactersTabDescription(menu_instance) {
	var instance =  new ClassCharactersTabDescription(menu_instance);
	instance.create_buttons();
	instance.init();
	return instance;
}

function ClassCharactersTabDescription(menu_instance) : ClassCharactersTab(menu_instance) constructor {
	buttons = [];
	button_id = 0;
	is_hover_on_buttons = false;
	static base1_draw = draw;
	static base1_update = update;
	static base_init = init;
	static button_offset_x = 20;
	static button_offset_y = 30;
	static offset_from_buttons = 10;
	static color_selected = c_yellow;
	static scroll_width = 300;
	static scroll_height = 130;
	static scroll_wheel_speed = 10;
	static char_height = char_get_height("W", global._font_main_determination);
	activated_button_id = -1;
	scrolls = [];
	
	static on_click_on_character = function() {}
	
	static init = function() {
		init_scrolls();
		base_init();
	}
	
	static change_character = function(_id) {
		character_id = _id;
		characters[0] = menu_instance.characters[_id][0];
		var count_characters = 1;
		self.count_cell_horizontal = 1;
		self.count_cell_vertical = 1;
		base_init();
	}
	
	static draw_action = function(text_height, name, description, text_stamina = undefined) {
		var sep = 15;
		var w = 260;
		var offset_x = 10;
		var offset_y = 10;
		var offset_from_text = 10;
		
		var text = description;
		if (text_stamina != undefined) {
			text += sprintf("\n{0} {1}", text_stamina, menu_instance.text.stamines);
		}
		text_height += offset_y;
			
		draw_set_font(global._font_main_determination);
		text_height = draw_text_scroll(name, offset_x, text_height, sep, w);
				
		draw_set_font(global._font_main_mini);
		text_height = draw_text_scroll(text, offset_x, text_height, sep, w);
			
		text_height += offset_from_text;
		return text_height;
	}
	
	static draw_text_scroll = function(text, x, y, sep, w) {
		var height = string_height_ext(text, sep, w);
		if (y + height > 0) { 
			draw_text_ext(x, y, text, sep, w); 
		}
		
		return y + height;
	}
	
	static init_scrolls = function() {
		scrolls[0] = UIScroll(scroll_width, scroll_height, function(scr, shift) {
			var character = characters[selected_character];
			var passive_skill = character.statistics.passive_skill;
			var actions = character.statistics.actions;
			var action_cost = character.statistics.action_stamina_cost;
			var special_action = character.statistics.special_action;
			var text_height = -shift;
			
			text_height = draw_action(text_height, passive_skill.name, passive_skill.description);
			var i = 0;
			repeat (array_length(actions)) {
				text_height = draw_action(text_height, actions[i].name, actions[i].description, string(action_cost[i]));
				i++;
			}
			text_height = draw_action(text_height, special_action.name, special_action.description);
			return text_height + shift;
		});
		
		scrolls[1] = UIScroll(scroll_width, scroll_height, function(scr, shift) {
			var character = characters[selected_character];
			var actions = character.statistics.actions;
			var sep = 15;
			var w = scroll_width - 60;
			var offset_x = 10;
			var offset_y = 10;
			var text_height = 0;
			
			var text = character.statistics.bio;
				
			draw_set_font(global._font_main_mini);
			draw_text_ext(offset_x, offset_y + text_height - shift, text, sep, w);
			text_height += string_height_ext(text, sep, w);
			
			return offset_y + text_height;
		});
	}
	
	static on_hover_on_button = function(_id) {
		buttons[button_id].unfocus();
		button_id = _id;
		buttons[button_id].focus();
		is_hover_on_buttons = true;
		audio_play_sound_plugging(snd_click);
	}
	
	static on_click_on_button = function(_id) {
		activated_button_id = _id;
		audio_play_sound_plugging(snd_selection);
		
		if (_id == 2) {
			close();
		}
	}
	
	static close = function() {
		buttons[button_id].unfocus();
		is_hover_on_buttons = false;
		menu_instance.change_tab(characters_tab.characters);
		for (var i = 0; i < array_length(scrolls); i++) {
			scrolls[i].set_scroll(0);
		}
	}
	
	static change_selected_button = function(_id, is_play_sound = true) {
		if (_id < 0 || _id >= array_length(buttons)) return;
		
		buttons[button_id].unfocus();
		button_id = _id;
		buttons[button_id].focus();
		if (is_play_sound) audio_play_sound_plugging(snd_click);
	}
	
	static create_buttons = function() {
		buttons[0] = UITextButton(menu_instance.text.attacks);
		buttons[1] = UITextButton(menu_instance.text.description);
		buttons[2] = UITextButton(menu_instance.text.back);
		
		for (var i = 0; i < array_length(buttons); i++) {
			buttons[i].is_auto_focus = false;
			buttons[i].text_hover_color = color_selected;
			buttons[i]._id = i;
			buttons[i].on_hover = function(button) { on_hover_on_button(button._id) };
			buttons[i].callback = function(button) { on_click_on_button(button._id) };
		}
	}
	
	static get_scroll = function() {
		if (activated_button_id != -1 && activated_button_id < array_length(scrolls)) {
			return scrolls[activated_button_id];
		}
	}
	
	static update = function() {
		if (menu_instance.input_held_vertical = 1) {
			if (get_scroll() != undefined) {
				scrolls[activated_button_id].scroll_down();
			}
		}
		
		if (menu_instance.input_held_vertical = -1) {
			if (get_scroll() != undefined) {
				scrolls[activated_button_id].scroll_up();
			}
		}
		
		if (menu_instance.input_enter && !is_hover_on_buttons) {
			is_hover_on_buttons = true;
			change_selected_button(0);
			menu_instance.input_enter = 0;
		}
		
		if (menu_instance.input_back && is_hover_on_buttons) {
			is_hover_on_buttons = false;
			change_selected_button(0);
			menu_instance.input_back = 0;
			activated_button_id = -1;
		}
		
		if (array_length(character_frames) == 1) {
			is_hover_on_buttons = true;
		}
		
		if (menu_instance.input_wheel = 1) {
			scrolls[activated_button_id].scroll_up(scroll_wheel_speed);
		}
		
		if (menu_instance.input_wheel = -1) {
			scrolls[activated_button_id].scroll_down(scroll_wheel_speed);
		}
		
		if (!is_hover_on_buttons) {
			base1_update();
			return;
		}
		
		if (menu_instance.input_back) {
			close();
			return;
		}
		
		if (menu_instance.input_horizontal != 0) {
			change_selected_button(button_id + menu_instance.input_horizontal);
		}
		
		if (menu_instance.input_enter) {
			buttons[button_id].press();
		}
	}
	
	static draw = function() {
		base1_draw();
		
		var rectangle_x = menu_instance.rec_x1;
		var rectangle_y = menu_instance.rec_y1;
		var offset_x = menu_instance.dist_x;
		var offset_y = menu_instance.dist_y;
		var frame_height = menu_instance.frame_height;
		var top_shift = menu_instance.top_shift;
		
		var position_y = rectangle_y + frame_height * count_cell_vertical + offset_y * count_cell_vertical + top_shift + button_offset_y;
		var text_width = 0;
		
		for (var i = 0; i < array_length(buttons); i++) {
			var button = buttons[i];
			
			draw_set_font(global._font_main_determination);
			var text_width_current = string_width(button.text);
			
			button.draw(rectangle_x + (offset_x * i + 1) + text_width + offset_from_buttons * i + button_offset_x + text_width_current / 2, position_y);
			
			draw_set_font(global._font_main_determination);
			text_width += string_width(button.text);
		}
		
		if (activated_button_id != -1 && activated_button_id < array_length(scrolls)) {
			scrolls[activated_button_id].draw(rectangle_x + button_offset_x, position_y + 20);
		}
	}
}