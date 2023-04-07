function UIInput1Box(image, default_text, width, height, is_show_text = true) {
	var instance = new ClassUIInputBox(image, default_text, width, height, is_show_text);
	instance.init();
	
	return instance;
}

function ClassUIInput1Box(image, default_text, width, height, is_show_text) constructor {
	self.image = image;
	self.default_text = default_text;
	self.width = width;
	self.height = height;
	self.text = ""; // main text
	self.is_show_text = is_show_text;
	
	halign = fa_left;
	valign = fa_middle;
	
	font = font_determination;
	
	text_length = 0;
	
	text_selecting_position = {
		beginning: -1,
		_end: -1,
	}
	start_text_selecting = {
		position_x: undefined,
		index: undefined,
	} // need for mouse selecting
	count_clicks = 0;
	need_count_click = 2;
	timer_reset_clicks = Timer(30, function() {
		count_clicks = 0;
	})
	
	show_cursor = true;
	cursor_position = 0;
	cursor_blink_delay = 30;
	cursor_blink_amount = 1;
	cursor_blink_time = 0;
	cursor_width = 1;
	cursor_height = char_get_height("W", font) < height ? height : char_get_height("W", font);
	cursor_offset = 1;
	
	is_fast_removing_char = false;
	time_until_fast_removing_char = 15;
	fast_removing_char_time_source = undefined;
	
	is_can_remove_char = true;
	removing_char_delay = 5;
	
	is_active = false;
	
	image_color = c_white;
	image_alpha = 1;
	
	surface = undefined;
	
	default_text_offset_x = 5;
	default_text_offset_y = height / 2;
	
	text_left_shift = 0;
	box_max_chars = 0;
	
	start_render_char_index = 1;
	
	mouse_hover = false;
	is_mouse_input = true;
	
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
	
	activating_mouse = false;
	deactivating_mouse = false;
	
	static init = function() {
		surface = surface_create(width - default_text_offset_x * 2, height);
		
		if (is_desktop) {
			inputs.input_char.on_input = function() {
				input_char();
			}
		
			inputs.deleting_left.on_input = function() {
				if (has_text_selecting()) {
					var position = text_selecting_position;

					remove_part_char_in_text(position.beginning, position._end - position.beginning + 1);
					reset_selecting();
				
					return;
				}
			
				remove_char_in_position_in_text(cursor_position);
			}
		
			inputs.deleting_right.on_input = function() {
				if (has_text_selecting()) {
					var position = text_selecting_position;
					remove_part_char_in_text(position.beginning, position._end - position.beginning + 1);
					reset_selecting();
					return;
				}
			
				if (cursor_position == text_length) return;
			
				remove_char_in_position_in_text(cursor_position + 1, false);
			}
		
			inputs.cursor_moving_right.on_input = function() {
				change_cursor_position(cursor_position + 1);
			}
		
			inputs.cursor_moving_left.on_input = function() {
				change_cursor_position(cursor_position - 1);
			}
		
			inputs.home.on_input = function() {
				change_cursor_position(0);
			}
		
			inputs._end.on_input = function() {
				change_cursor_position(text_length);
			}
		
			inputs.all_select.on_input = function() {
				change_selecting_position(1, text_length);
			}
		
			inputs.copy_text.on_input = function() {
				var position = text_selecting_position;
			
				if (!has_text_selecting()) return;
			
				clipboard_set_text(get_text_selecting());
			}
		
			inputs.paste_text.on_input = function() {
				var _text = clipboard_get_text();
			
				if (string_is_empty(_text)) return;
			
				add_text_in_position_in_text(_text, cursor_position)
			}
		
			inputs.all_select_mouse.is_mouse = true;
			inputs.all_select_mouse.only_holding = true;
		}
		
		if (is_mobile) {
			global.virtual_keyboard.on_data.connect(function(args) {
				if (!is_active) return;
				
				remove_all_char_in_text();
				add_text_in_last_position_in_text(args[0]);
				deactivating_mouse = true;
				is_active = false;
			});
		}
	}
	
	static update = function(position_x, position_y) {
		mouse_hover = point_in_rectangle_gui(position_x, position_y, position_x + width, position_y + height);
		
		activating_mouse = false;
		deactivating_mouse = false;
		
		if (!mouse_hover && mouse_check_button_pressed(mb_any) && is_mouse_input) {
			deactivating_mouse = true;
			is_active = false;
		}
		
		if (mouse_hover && mouse_check_button_pressed(mb_left) && is_mouse_input) {
			activating_mouse = true;
			is_active = true;
			if (is_mobile) {
				get_string_async("Enter text", text);
			}
		}
		
		if (keyboard_check_pressed(vk_enter) && is_desktop) {
			deactivating_mouse = true;
			is_active = false;
		}
		
		if (!is_active) return;
		
		// blinking cursor
		cursor_blink_time = approach(cursor_blink_time, show_cursor ? cursor_blink_delay : 0, cursor_blink_amount);
		cursor_blink_time = clamp(cursor_blink_time, 0, cursor_blink_delay);
		show_cursor = show_cursor ? cursor_blink_time < cursor_blink_delay : !cursor_blink_time > 0;
		
		if (is_mobile) return;
		
		var array_inputs = variable_struct_get_names(inputs);
		
		for (var i = 0; i < array_length(array_inputs); i++) {
			inputs[$ array_inputs[i]].update();
		}
		
		if (mouse_check_button_pressed(mb_left) && get_char_index_by_x(position_x, mouse_gui_x) == undefined) {
			change_cursor_position(text_length);
		}
		
		if (mouse_check_button_pressed(mb_left)) {
			count_clicks += 1;
			timer_reset_clicks.reset();
		}
		
		timer_reset_clicks.update();
		
		if (mouse_hover && mouse_check_button(mb_left) && is_desktop) {
			var char_index = get_char_index_by_x(position_x, mouse_gui_x);
			
			if (char_index != undefined) {
				var char_x = get_char_x(position_x, char_index);
				var char_width = string_width(string_copy(text, char_index, 1));
				var index_offset = char_x >= mouse_gui_x && char_x - char_width / 2 <= mouse_gui_x;
				
				if (mouse_check_button_pressed(mb_left)) {
					change_cursor_position(char_index - index_offset);
					start_text_selecting.position_x = mouse_gui_x;
					start_text_selecting.index = char_index;
				}
				
				if (count_clicks >= need_count_click) {
					change_selecting_position(1, text_length);
				}
				
				// mouse selecting
				if (mouse_gui_x != start_text_selecting.position_x) {
					var is_revers = mouse_gui_x < start_text_selecting.position_x;
					change_selecting_position(is_revers ? char_index : start_text_selecting.index, is_revers ? start_text_selecting.index : char_index);
				}
			}
		}
	}
	
	static draw = function(position_x, position_y) {
		var draw_text_position_x = position_x + default_text_offset_x;
		var draw_text_position_y = position_y + default_text_offset_y;
		
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
		if (is_active && show_cursor) {
			var char_x = get_char_x(0, cursor_position - (start_render_char_index - 1));
			draw_line_width(char_x + cursor_offset, height / 2 - cursor_height / 2, char_x + cursor_offset, height / 2 + cursor_height / 2, cursor_width);
		}
		
		// Selecting
		if (has_text_selecting() && !string_is_empty(text) && text_selecting_position.beginning != undefined) {
			var position = text_selecting_position;
			var char_x_beginning = position.beginning == start_render_char_index ? 0 : get_char_x(0, position.beginning -1);
			var char_x_end = position._end == box_max_chars ? width : get_char_x(0, position._end);
			
			draw_set_alpha(0.7);
			draw_rectangle(char_x_beginning, 0, char_x_end, height, false);
			draw_set_alpha(1);
		} else {
			reset_selecting();
		}
		
		result_text = string_copy(text, 1, text_length);
		
		if (!check_free_box()) {
			result_text = string_copy(text, start_render_char_index, cursor_position - (start_render_char_index - 1));
		}
			
		if (!check_free_box() && start_render_char_index == 1) {
			result_text = string_copy(text, 1, box_max_chars);
		}
		
		if (!is_show_text) {
			result_text = string_repeat("*", string_length(result_text));
		}
		
		draw_text(-text_left_shift, height / 2, result_text);
		
		// default text
		if (string_is_empty(text) && !is_active) {
			draw_text(0, height / 2, default_text);
		}
		
		surface_reset_target();
		draw_surface(surface, draw_text_position_x, position_y);
	}
	
	static input_char = function() {
		if (!string_is_empty(keyboard_string)) {
			show_cursor = true;
			cursor_blink_time = 0;
			
			if (has_text_selecting()) {
				var position = text_selecting_position;
				remove_part_char_in_text(position.beginning, position._end - position.beginning + 1);
				reset_selecting();
			}
				
			add_text_in_position_in_text(string_char_at(keyboard_string, string_length(keyboard_string)), cursor_position);
			keyboard_string = "";
		}
	}
	
	static has_text_selecting = function() {
		var position = text_selecting_position;
		return position.beginning != -1 && position._end != -1;
	}
	
	static reset_selecting = function() {
		text_selecting_position.beginning = -1;
		text_selecting_position._end = -1;
	}
	
	static change_selecting_position = function(start, _end) {
		if (string_is_empty(text)) return;
		
		text_selecting_position.beginning = start;
		text_selecting_position._end = _end;
	}
	
	static get_text_selecting = function() {
		var position = text_selecting_position;
		
		if (position.beginning == -1 || position._end == -1) {
			return "";
		}
		
		if (position.beginning < position._end) {
			return string_copy(text, position.beginning, position._end - position.beginning + 1);
		}
		
		if (position.beginning > position._end) {
			return string_copy(text, position._end, position.beginning - position._end + 1);
		}
		
		if (position.beginning = position._end) {
			return string_copy(text, position.beginning, 1);
		}
	}
	
	static get_last_visible_char_position = function() {
		if (!check_free_box() && start_render_char_index == 1) {
			return box_max_chars;
		}
		
		if (!check_free_box()) {
			return cursor_position - (start_render_char_index - 1)
		}
		
		return text_length;
	}
	
	static check_free_box = function() {
		draw_set_font(font);
		var text_width = string_width(text);
		
		if (text_width > width - default_text_offset_x * 2) return false;
		
		return true;
	}
	
	static get_char_x = function(position_x, index) {
		return position_x + string_width(string_copy(text, start_render_char_index, index));
	}
	
	static get_char_y = function(position_y, index) {
		return position_y + default_text_offset_y + string_height(text);
	}
	
	static get_char_index_by_x = function(render_position_x, position_x) {
		draw_set_font(font_determination);
		
		render_position_x += default_text_offset_x;
		
		for (var i = start_render_char_index; i <= text_length; i++) {
			if (!check_free_box()) {
				if (i > cursor_position && box_max_chars == 0) { break; }
				if (i > box_max_chars && box_max_chars != 0) { break; }
			}
			
			var _x1 = render_position_x;
			var char_width = string_width(string_copy(text, i, 1));
			var _x2 = render_position_x + char_width;
			
			if (_x1 <= position_x && _x2 >= position_x) {
				return i;
			}
			
			render_position_x += char_width;
		}
	}
	
	static sync_max_char_in_box = function() {
		var length = 0;
		box_max_chars = 0;
		
		for (var i = 0; length < width - default_text_offset_x * 2; i--) {
			draw_set_font(font);
			length += string_width(string_copy(text, i, 1));
			
			box_max_chars += 1;
		}
	}
	
	static sync_start_render_char = function() {
		if (check_free_box()) {
			text_left_shift = 0;
			start_render_char_index = 1;
			return;
		}
		
		var length = 0;
		box_max_chars = 0;
		
		for (var i = cursor_position; length < width - default_text_offset_x * 2; i--) {
			if (i <= 0) {
				start_render_char_index = 1;
				text_left_shift = 0;
				sync_max_char_in_box();
				break;
			}
			
			draw_set_font(font);
			length += string_width(string_copy(text, i, 1));
			
			if (length == width - default_text_offset_x * 2) {
				text_left_shift = 0;
				start_render_char_index = i;
				break;
			}
			
			if (length > width - default_text_offset_x * 2) {
				text_left_shift = length - (width - default_text_offset_x * 2);
				start_render_char_index = i;
			}
			
			if (i == 1) {
				sync_max_char_in_box();
			}
		}
	}
	
	static change_cursor_position = function(index) {
		if (cursor_position == index) return;
		
		var old_position = cursor_position;
		
		if (index < 0) { index = 0 }
		if (index >= text_length) { index = text_length }
		
		cursor_position = index;
		
		if (has_text_selecting()) {
			cursor_position = cursor_position < old_position ? text_selecting_position.beginning - 1 : text_selecting_position._end;
			reset_selecting();
		}
		
		sync_start_render_char();
	}
	
	static add_text_in_last_position_in_text = function(_text) {
		text += _text;
		text_length = string_length(text);
		change_cursor_position(cursor_position + string_length(_text));
	}
	
	static add_text_in_position_in_text = function(_text, index) {
		var old_text = text;
		
		if (index != 0 && index != text_length) {
			text = string_copy(text, 1, index) + _text + string_copy(text, index + 1, text_length - index);
		}
		
		if (index == text_length) {
			add_text_in_last_position_in_text(_text);
			return;
		}
		
		if (index == 0) {
			text = _text + old_text;
		}
		
		text_length = string_length(text);
		change_cursor_position(cursor_position + string_length(_text));
	}
	
	static remove_last_char_in_text = function() {
		if (string_is_empty(text)) return;
		var old_text_length = text_length;
		
		text = string_delete(text, string_length(text), 1);
		text_length = string_length(text);
		
		if (cursor_position == old_text_length) {
			change_cursor_position(cursor_position - 1);
		}
	}
	
	static remove_char_in_position_in_text = function(index, is_move_cursor = true) {
		var text_old = text;
		
		if (index == text_length) {
			remove_last_char_in_text();
			return;
		}
		
		if (index == 0) {
			return;
		}
		
		if (index != 0 && index != text_length) {
			text = string_copy(text, 1, index - 1) + string_copy(text, index + 1, text_length - index);
		}
		
		text_length = string_length(text);
		
		if (!is_move_cursor) return;
		change_cursor_position(index - 1);
	}
	
	static remove_part_char_in_text = function(index, index_2) {
		text = string_delete(text, index, index_2);
		text_length = string_length(text);
		change_cursor_position(index - 1);
	}
	
	static remove_all_char_in_text = function() {
		remove_part_char_in_text(1, text_length);
	}
}