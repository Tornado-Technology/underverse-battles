function UIInputBox(image, default_text, width, height, is_show_text = true) {
	var instance = new ClassUIInputBox(image, default_text, width, height, is_show_text);
	instance.init();
	
	return instance;
}

function ClassUIInputBox(image, default_text, width, height, is_show_text) constructor {
	self.image = image;
	self.default_text = default_text;
	self.width = width;
	self.height = height;
	self.text = "";
	self.is_show_text = is_show_text;
	
	halign = fa_left;
	valign = fa_middle;
	
	font = font_determination;
	
	text_width = 0;
	text_length = 0;
	text_rendering = "";
	text_rendering_length = 0;
	text_rendering_width = 0;
	
	is_show_cursor = true;
	cursor_position = 0;
	cursor_blink_delay = 30;
	cursor_blink_amount = 1;
	cursor_blink_time = 0;
	cursor_width = 1;
	cursor_height = char_get_height("W", font) < height ? height : char_get_height("W", font);
	cursor_offset = 1;
	cursor_position_x = 0;
	cursor_position_y_first = 0;
	cursor_position_y_second = 0;
	
	is_active = false;
	
	image_color = c_white;
	image_alpha = 1;
	
	surface = undefined;
	
	default_text_offset_x = 5;
	default_text_offset_y = height / 2;
	
	text_left_shift = 0;
	
	mouse_hover = false;
	
	char_rendering_widths = [];
	
	on_activating_mouse = function() {}
	on_deactivating_mouse = function() {}
	
	start_rendering_char_index = 0;
	
	inputs = {
		input_char: __InputTextBox(vk_anykey),
		cursor_moving_right: __InputTextBox(vk_right),
		cursor_moving_left: __InputTextBox(vk_left),
		deleting_left: __InputTextBox(vk_backspace),
		deleting_right: __InputTextBox(vk_delete),
		home: __InputTextBox(vk_home),
		_end: __InputTextBox(vk_end),
		all_select: __InputTextBox(ord("A"), vk_control),
		all_select_mouse: __InputTextBox(mb_left),
		copy_text: __InputTextBox(ord("C"), vk_control),
		paste_text: __InputTextBox(ord("V"), vk_control),
	}
	
	static init = function() {
		surface = surface_create(width - default_text_offset_x * 2, height);
		
		if (is_desktop) {
			inputs.input_char.on_input = function() {
				if (!string_is_empty(keyboard_string)) {
					cursor_position++;
					add_char(string_char_at(keyboard_string, 1), cursor_position);
					
					keyboard_string = "";
				}
			}
		
			inputs.deleting_left.on_input = function() {
				remove_char(cursor_position);
			}
		
			inputs.deleting_right.on_input = function() {
				remove_char(cursor_position + 1, false);
			}
		
			inputs.cursor_moving_right.on_input = function() {
				move_cursor_right();
			}
		
			inputs.cursor_moving_left.on_input = function() {
				move_cursor_left();
			}
		
			inputs.home.on_input = function() {
				change_cursor_position(0);
			}
		
			inputs._end.on_input = function() {
				change_cursor_position(text_length);
			}
		
			inputs.all_select.on_input = function() {
				
			}
		
			inputs.copy_text.on_input = function() {
				
			}
		
			inputs.paste_text.on_input = function() {
				
			}
		
			inputs.all_select_mouse.is_mouse = true;
			inputs.all_select_mouse.only_holding = true;
		}
		
		if (is_mobile) {
			global.virtual_keyboard.on_data.connect(function(args) {
				if (!is_active) return;
				
			});
		}
	}
	
	static update = function(position_x, position_y) {
		var is_click = mouse_check_button_pressed(mb_left);
		mouse_hover = point_in_rectangle_gui(position_x, position_y, position_x + width, position_y + height);
		
		if (mouse_hover && is_click && !is_active) {
			enable();
			on_activating_mouse();
			
			if (is_mobile) {
				get_string_async("Enter ", text);
			}
		}
		
		if (!is_active) return;
		
		if (!mouse_hover && is_click && is_active) {
			disable();
		}
		
		if (keyboard_check_pressed(vk_enter) ) {
			disable();
		}
		
		// blinking cursor
		cursor_blink_time = approach(cursor_blink_time, is_show_cursor ? cursor_blink_delay : 0, cursor_blink_amount);
		cursor_blink_time = clamp(cursor_blink_time, 0, cursor_blink_delay);
		is_show_cursor = is_show_cursor ? cursor_blink_time < cursor_blink_delay : !cursor_blink_time > 0;
		
		if (is_mobile) return;
		
		var array_inputs = variable_struct_get_names(inputs);
		
		for (var i = 0; i < array_length(array_inputs); i++) {
			inputs[$ array_inputs[i]].update();
		}
	}
	
	static draw = function(position_x, position_y) {
		var draw_text_position_x = position_x + default_text_offset_x;
		
		// box
		draw_sprite_stretched_ext(image, 0, position_x, position_y, width, height, image_color, image_alpha);
		
		draw_set_halign(halign);
		draw_set_valign(valign);
		draw_set_font(font);
		
		var result_text = "";
		
		if (!surface_exists(surface)) {
			surface = surface_create(width - default_text_offset_x * 2, height);	
		}
		
		surface_set_target(surface);
		draw_clear_alpha(0, 0);
		
		// Cursor
		if (is_active && is_show_cursor) {
			draw_line_width(cursor_position_x, cursor_position_y_first, cursor_position_x, cursor_position_y_second, cursor_width);
		}
		
		result_text = text_rendering;
		
		if (!is_show_text) {
			result_text = string_repeat("*", string_length(text_rendering));
		}
		
		draw_text(-text_left_shift, height / 2, result_text);
		
		// default text
		if (string_is_empty(text) && !is_active) {
			draw_text(0, height / 2, default_text);
		}
		
		surface_reset_target();
		draw_surface(surface, draw_text_position_x, position_y);
	}
	
	static enable = function() {
		is_active = true;
		input_lock_all();
	}
	
	static disable = function() {
		is_active = false;
		input_unlock_all();
	}
	
	static input_char = function() {
		if (!string_is_empty(keyboard_string)) {
			is_show_cursor = true;
			cursor_blink_time = 0;
				
			add_text_in_position_in_text(string_char_at(keyboard_string, string_length(keyboard_string)), cursor_position);
			keyboard_string = "";
		}
	}
	
	static get_rendering_text = function() {
		var real_width = get_real_width();
		var lenght = 0;
		var text1 = "";
		var text2 = "";
		var index = cursor_position;
		
		while (lenght < real_width) {
			start_rendering_char_index = index;
			
			if (index <= 0) { 
				start_rendering_char_index = 1;
				break;
			}
			
			var char = string_char_at(text, index);
			lenght += char_get_width(char, font, true);
			text1 += char;
			index--;
		}
		
		text1 = string_reverse(text1);
		index = cursor_position + 1;
		
		while (lenght < real_width) {
			if (index > text_length) break; 
			
			var char = string_char_at(text, index);
			lenght += char_get_width(char, font, true);
			text2 += char;
			index++;
		}
		
		return text1 + text2;
	}
	
	static get_real_width = function() {
		return width - default_text_offset_x * 2;
	}
	
	static check_free_box = function() {
		return !(text_width > get_real_width());
	}
	
	static update_char_widths = function() {
		for (var i = 1; i <= text_rendering_length; i++) {
			char_rendering_widths[i] = string_char_at(text_rendering, i);
		}
	}
	
	static add_char_in_end = function(char) {
		add_char(char, text_length + 1);
	}
	
	static add_char_in_beginning = function(char) {
		add_char(char, 1);
	}
	
	static add_char = function(char, position) {
		text = string_insert(char, text, position);
		is_show_cursor = true;
		cursor_blink_time = 0;
		
		update_state();
	}
	
	static remove_char_end = function() {
		remove_char(text_length);
	}
	
	static remove_char_beginning = function() {
		remove_char(1);
	}
	
	static remove_char = function(position, is_move_cursor = true) {
		if (position <= 0 || position > text_length) return;
		
		text = string_delete(text, position, 1);
		if (is_move_cursor || cursor_position == text_length) {
			cursor_position--;
		}
		update_state();
	}
	
	static move_cursor_right = function() {
		change_cursor_position(cursor_position + 1);
	}
	
	static move_cursor_left = function() {
		change_cursor_position(cursor_position - 1);
	}
	
	static change_cursor_position = function(position) {
		if (position < 0 || position > text_length) return;
		
		cursor_position = position;
		update_state();
	}
	
	static update_position_cursor = function() {
		cursor_position_x = string_width(string_copy(text, start_rendering_char_index, cursor_position - (start_rendering_char_index - 1))) + cursor_offset;
		cursor_position_y_first = height / 2 - cursor_height;
		cursor_position_y_second = height / 2 + cursor_height / 2;
		
		if (!check_free_box() && start_rendering_char_index != 1) {
			cursor_position_x = surface_get_width(surface) - cursor_width;
		}
	}
	
	static update_state = function() {
		draw_set_font(font);
		text_length = string_length(text);
		text_width = string_width(text);
		text_rendering = get_rendering_text();
		text_rendering_width = string_width(text_rendering);
		text_rendering_length = string_length(text_rendering);
		text_left_shift = 0;
		char_rendering_widths = [];
		
		update_char_widths();
		update_position_cursor();
		
		if (!check_free_box()) {
			var real_width = get_real_width();
			text_left_shift = text_rendering_width - real_width;
		}
	}
}