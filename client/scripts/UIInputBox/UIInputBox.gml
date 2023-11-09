function UIInputBox(image, default_text, width, height, is_show_text) constructor {
	self.image = image;
	self.default_text = default_text;
	self.width = width;
	self.height = height;
	self.text = "";
	self.is_show_text = is_show_text;
	
	self.position_x = 0;
	self.position_y = 0;
	
	halign = fa_left;
	valign = fa_middle;
	
	font = global._font_main_determination;
	
	text_width = 0;
	text_length = 0;
	text_rendering = "";
	text_rendering_length = 0;
	text_rendering_width = 0;
	
	selecting_position = {
		beginning: 0,
		ending: 0,
	}
	
	selecting_rendering_position = {
		beginning: 0,
		ending: 0,
	}
	
	selecting_rectangle_position = {
		beginning: 0,
		ending: 0,
	}
	
	selecting_alpha = 0.7;
	
	is_show_cursor = true;
	cursor_position = 0;
	cursor_blink_delay = 30;
	cursor_blink_amount = 1;
	cursor_blink_time = 0;
	cursor_width = 1;
	cursor_height = char_get_height("W", font) < height ? height : char_get_height("W", font);
	cursor_offset = 1;
	cursor_position_x = 0;
	cursor_position_y_first = height / 2 - cursor_height;
		cursor_position_y_second = height / 2 + cursor_height / 2;
	
	is_active = false;
	
	image_color = c_white;
	image_alpha = 1;
	
	surface = undefined;
	surface_width = 0;
	
	default_text_offset_x = 5;
	default_text_offset_y = height / 2;
	
	text_left_shift = 0;
	
	mouse_hover = false;
	
	char_rendering_widths = [];
	char_rendering_position_x = [];
	
	on_activating_mouse = function() {}
	on_deactivating_mouse = function() {}
	
	beginning_rendering_char_index = 0;
	
	// mouse selecting
	is_clicked = false;
	previous_position_x = 0;
	beginning_char_selecting_index = 0;
	is_selecting_mouse = false;
	
	time_to_fast_input_char = 15;
	delay_fast_input_char = 3;
	is_fast_input = false;
	is_can_input = false;
	
	timer_fast_input_char = Timer(time_to_fast_input_char, function() {
		is_fast_input = true;
	});
	timer_fast_input_char_delay = Timer(delay_fast_input_char, function() {
		is_can_input = true;
	});
	
	inputs = {
		cursor_moving_right: __InputTextBox(vk_right),
		cursor_moving_left: __InputTextBox(vk_left),
		deleting_left: __InputTextBox(vk_backspace),
		deleting_right: __InputTextBox(vk_delete),
		home: __InputTextBox(vk_home),
		_end: __InputTextBox(vk_end),
		all_select: __InputTextBox(ord("A"), vk_control),
		cut_text: __InputTextBox(ord("X"), vk_control),
		copy_text: __InputTextBox(ord("C"), vk_control),
		paste_text: __InputTextBox(ord("V"), vk_control),
	}

	on_data_connection = undefined;

	self.init();

	static init = function() {
		surface = surface_create(width - default_text_offset_x * 2, height);
		surface_width = surface_get_width(surface);
		
		if (is_desktop) {
			inputs.deleting_left.on_input = function() {
				if (has_selecting_text()) {
					remove_selected_text();
					return;
				}
				
				remove_char(cursor_position);
			}
		
			inputs.deleting_right.on_input = function() {
				if (has_selecting_text()) {
					
					return;
				}
				
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
				selecting_all();
			}
		
			inputs.copy_text.on_input = function() {
				if (!has_selecting_text()) return;
				
				return clipboard_set_text(get_selecting_text());
			}
			
			inputs.cut_text.on_input = function() {
				if (!has_selecting_text()) return;
			
				clipboard_set_text(get_selecting_text());
				
				remove_selected_text();
			}
		
			inputs.paste_text.on_input = function() {
				var text = clipboard_get_text();
				if (string_is_empty(text)) return;
				
				var position = !has_selecting_text() ? cursor_position + 1 : selecting_position.beginning;
				paste_text(text, position);
			}
		}
		
		if (!is_mobile) return;
		on_data_connection = global.virtual_keyboard.on_data.connect(function(args) {
			if (!is_active) return;
				
			remove_part_text(1, text_length);
			
			paste_text(args[0], 1);
			is_active = false;
		});
	}
	
	static destroy = function() {
		if (!is_mobile) return;
		global.virtual_keyboard.on_data.disconnect(on_data_connection);
	}
	
	static update = function(position_x, position_y) {
		self.position_x = position_x;
		self.position_y = position_y
		var is_click_pressed = mouse_check_button_pressed(mb_left);
		var is_click = mouse_check_button(mb_left);
		var _mouse_gui_x = mouse_gui_x;
		mouse_hover = point_in_rectangle_gui(position_x, position_y, position_x + width, position_y + height);
		
		if (mouse_hover && is_click_pressed && !is_active) {
			enable();
			on_activating_mouse();
			
			if (is_mobile) {
				get_string_async(default_text, text);
			}
		}
		
		if (!is_active) return;
		
		if (!mouse_hover && is_click_pressed && is_active) {
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
		
		// all selecting mouse
		if (is_click_pressed && !string_is_empty(text)) {
			if (is_clicked && previous_position_x == _mouse_gui_x) {
				selecting_all();
			}
			
			if (is_clicked && previous_position_x != _mouse_gui_x) {
				is_clicked = false;
			}
			
			is_clicked = true;
			previous_position_x = _mouse_gui_x;
		}
		
		// mouse selection
		var founded_index = find_char_from_mouse();
		
		if (founded_index != undefined) {
			founded_index++;
		}
		
		if (founded_index != undefined && is_click && !is_click_pressed) {
			if (!is_selecting_mouse && previous_position_x != _mouse_gui_x) {
				change_selection_from_rendering(founded_index, founded_index);
				beginning_char_selecting_index = founded_index;
				is_selecting_mouse = true;
			}
			
			if (is_selecting_mouse) {
				var is_revers = founded_index < beginning_char_selecting_index;
				change_selection_from_rendering(is_revers ? founded_index : beginning_char_selecting_index, is_revers ? beginning_char_selecting_index : founded_index);
			}
		}
		
		if (is_selecting_mouse && !is_click) {
			is_selecting_mouse = false;
		}
		
		// moving mouse cursor
		if (is_click_pressed && founded_index != undefined) {
			var pos = founded_index + beginning_rendering_char_index - 2
			
			if (founded_index == array_length(char_rendering_position_x)) {
				pos = char_rendering_position_x[founded_index - 1] + char_rendering_widths[founded_index - 1] / 2 < _mouse_gui_x ? pos + 1 : pos;
			}
			
			change_cursor_position(pos, false);
		}
		
		if (founded_index == undefined && is_click_pressed) {
			change_cursor_position(text_length, false);
		}
		
		// input char
		if (keyboard_check_pressed(vk_anykey)) {
			var str = keyboard_string;
			is_fast_input = false;
			input_char();
			
			if (get_char(text_length) != str) {
				timer_fast_input_char.stop(true);
				return;
			}
			
			timer_fast_input_char.start();
		}
		
		if (keyboard_check(vk_anykey) && is_can_input && is_fast_input) {
			is_can_input = false;
			timer_fast_input_char_delay.reset();
			input_char();
		}
		
		timer_fast_input_char.update();
		timer_fast_input_char_delay.update();
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
		if (is_active && is_show_cursor && !has_selecting_text()) {
			draw_line_width(cursor_position_x, cursor_position_y_first, cursor_position_x, cursor_position_y_second, cursor_width);
		}
		
		// Selecting
		if (has_selecting_text()) {
			draw_set_alpha(selecting_alpha);
			draw_rectangle(selecting_rectangle_position.beginning, 0, selecting_rectangle_position.ending, height, false);
			draw_set_alpha(1);
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
		reset_selecting();
		input_unlock_all();
	}
	
	static input_char = function() {
		if (!string_is_empty(keyboard_string) && char_is_valid(keyboard_string, font)) {
			var position = !has_selecting_text() ? cursor_position + 1 : selecting_position.beginning;
			
			add_char(string_char_at(keyboard_string, 1), position);
		}
		
		keyboard_string = "";
	}
	
	static get_rendering_text = function() {
		var real_width = get_real_width();
		var rendering_width = 0;
		var text_part_1 = "";
		var text_part_2 = "";
		var index = cursor_position;
		
		while (rendering_width < real_width) {
			beginning_rendering_char_index = index;
			
			if (index <= 0) { 
				beginning_rendering_char_index = 1;
				break;
			}
			
			var char = string_char_at(text, index);
			rendering_width += char_get_width(char, font, true);
			text_part_1 += char;
			index--;
		}
		
		text_part_1 = string_reverse(text_part_1);
		index = cursor_position + 1;
		
		while (rendering_width < real_width) {
			if (index > text_length) break; 
			
			var char = string_char_at(text, index);
			rendering_width += char_get_width(char, font, true);
			text_part_2 += char;
			index++;
		}
		
		return text_part_1 + text_part_2;
	}
	
	static get_real_width = function() {
		return width - default_text_offset_x * 2;
	}
	
	static has_empty_space = function() {
		return !(text_width > get_real_width());
	}
	
	static update_char_widths_and_position = function() {
		var _x = position_x + default_text_offset_x - text_left_shift;
		char_rendering_widths = [];
		char_rendering_position_x = [];
		
		for (var i = 1; i <= text_rendering_length; i++) {
			char_rendering_widths[i - 1] = string_width(string_char_at(text_rendering, i));
			char_rendering_position_x[i - 1] = _x;
			_x += char_rendering_widths[i - 1];
		}
	}
	
	static get_char = function(index) {
		return string_char_at(text, index);
	}
	
	static add_char_in_end = function(char) {
		add_char(char, text_length + 1);
	}
	
	static add_char_in_beginning = function(char) {
		add_char(char, 1);
	}
	
	static add_char = function(char, position) {
		remove_selected_text();
		text = string_insert(char, text, position);
		is_show_cursor = true;
		cursor_blink_time = 0;
		cursor_position += 1;
		
		update_state();
	}
	
	static validate_string = function(str) {
		var indexs = [];
		var str_lenght = string_length(str);
		var i = 1;
		repeat (str_lenght) {
			var symbol = string_char_at(str, i);
			
			if (!char_is_valid(symbol, font)) {
				array_push(indexs, i);
			}
			
			i++;
		}
		
		i = array_length(indexs) - 1;
		repeat(i + 1) {
			str = string_delete(str, indexs[i], 1);
			i--;
		}
		
		return str;
	}
	
	static paste_text = function(str, position) {
		str = validate_string(str);
		remove_selected_text();
		text = string_insert(str, text, position);
		is_show_cursor = true;
		cursor_blink_time = 0;
		cursor_position += string_length(str);
		
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
		
		reset_selecting();
		update_state();
	}
	
	static remove_selected_text = function() {
		if (!has_selecting_text()) return;
		remove_part_text(selecting_position.beginning, selecting_position.ending);
	}
	
	static remove_part_text = function(beginning, ending) {
		text = string_delete(text, beginning, ending - beginning + 1);
		cursor_position = beginning - 1;
		reset_selecting();
		
		update_state();
	}
	
	static move_cursor_right = function() {
		change_cursor_position(cursor_position + 1);
	}
	
	static move_cursor_left = function() {
		change_cursor_position(cursor_position - 1);
	}
	
	static change_cursor_position = function(position, change_position_from_selecting_text = true) {
		if (position < 0 || position > text_length) return;
		if (position == cursor_position) return;
		
		var old_position = cursor_position;
		
		cursor_position = position;
		is_show_cursor = true;
		cursor_blink_time = 0;
		
		if (has_selecting_text() && change_position_from_selecting_text) {
			cursor_position = position > old_position ? selecting_position.ending : selecting_position.beginning - 1;
		}
		reset_selecting();
		
		update_state();
	}
	
	static selecting_all = function() {
		change_selection(1, text_length)
	}
	
	static change_selection = function(beginning, ending) {
		selecting_position.beginning = beginning;
		selecting_position.ending = ending;
		selecting_rendering_position.beginning = beginning - beginning_rendering_char_index + beginning_rendering_char_index - beginning + 1;
		selecting_rendering_position.ending = ending - text_length + text_rendering_length;
		if (beginning == 0 || ending == 0) {
			selecting_rendering_position.beginning = beginning;
			selecting_rendering_position.ending = ending;
		}
		update_selecting_rectangle_position();
	}
	
	static change_selection_from_rendering = function(beginning, ending) {
		selecting_rendering_position.beginning = beginning 
		selecting_rendering_position.ending = ending 
		selecting_position.beginning = beginning + beginning_rendering_char_index - 1;
		selecting_position.ending = ending + beginning_rendering_char_index - 1;
		update_selecting_rectangle_position();
	}
	
	// binary search
	static find_char_from_mouse = function() {
	    var list = char_rendering_position_x;
		var first = 0;
		var value = mouse_gui_x;
	    var last = array_length(list) - 1;
	    var position = undefined;
	    var found = false;
	    var middle = undefined;
		
	    while (!found && first <= last) {
	        middle = floor((first + last) / 2);
		
			if (list[middle] <= value) {
				var is_next_element = array_length(list) > middle + 1;
			
				if (!is_next_element && list[middle] + char_rendering_widths[middle] >= value) {
					found = true;
					position = middle;
					continue;
				}
			
				if (is_next_element && list[middle + 1] > value) {
					found = true;
					position = middle;
					continue;
				}
			} 
		
			if (list[middle] > value) {
			    last = middle - 1;
				continue;
			}
		
			first = middle + 1;
	    }
	
	    return position;
	}
	
	static get_selecting_text = function() {
		if (selecting_position.ending != 0 && selecting_position.beginning != 0) {
			if (selecting_position.ending == selecting_position.beginning) {
				return string_char_at(text, selecting_position.ending);
			}
		}
		var count = selecting_position.ending - selecting_position.beginning;
		return string_copy(text, selecting_position.beginning, count) + (count != 0 ? string_char_at(text, selecting_position.ending) : "");
	}
	
	static has_selecting_text = function() {
		return !string_is_empty(get_selecting_text());
	}
	
	static update_selecting_rectangle_position = function() {
		var beggining = selecting_rendering_position.beginning;
		var ending = selecting_rendering_position.ending;
		var surface_position =  position_x + default_text_offset_x;
		
		if (beggining == 0 || ending == 0) {
			selecting_rectangle_position.beginning = 0;
			selecting_rectangle_position.ending = 0;
			return;
		}
		
		if (beggining == ending) {
			selecting_rectangle_position.beginning = char_rendering_position_x[beggining - 1] - surface_position;
			selecting_rectangle_position.ending = char_rendering_position_x[beggining - 1] + char_rendering_widths[beggining - 1] - surface_position;
			return;
		}
		
		selecting_rectangle_position.beginning = char_rendering_position_x[beggining - 1] - surface_position;
		selecting_rectangle_position.ending = char_rendering_position_x[ending - 1] + char_rendering_widths[ending - 1] - surface_position;
	}
	
	static reset_selecting = function() {
		change_selection(0, 0);
	}
	
	static update_position_cursor = function() {
		var rendrering_symbols_count = cursor_position - beginning_rendering_char_index + 1;
		var rendering_text = string_copy(text, beginning_rendering_char_index, rendrering_symbols_count);
		cursor_position_x = string_width(rendering_text) + cursor_offset;
		cursor_position_x = min(cursor_position_x, surface_width - cursor_width);
	}
	
	static update_state = function() {
		draw_set_font(font);
		text_length = string_length(text);
		text_width = string_width(text);
		text_rendering = get_rendering_text();
		text_rendering_width = string_width(text_rendering);
		text_rendering_length = string_length(text_rendering);
		text_left_shift = 0;
		
		update_char_widths_and_position();
		update_position_cursor();
		
		if (!has_empty_space()) {
			var real_width = get_real_width();
			text_left_shift = text_rendering_width - real_width;
		}
	}
}