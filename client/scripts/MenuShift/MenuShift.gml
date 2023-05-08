function MenuShift(key_translate, elements, start_element = 0, callback = function() {}) {
	var instance = new ClassMenuShift(key_translate, elements, callback, start_element);
	instance.translate_update();
	
	return instance;
}

function ClassMenuShift(key_translate, elements, callback, start_element) : ClassMenuElement(key_translate) constructor {
	self.callback = callback;
	self.elements = elements;
	element = start_element;
	elements_count = array_length(elements);
	is_shift = false;
	text_char_right_position_x = 0;
	text_shift = "";
	static base_update = update;
	static base_draw = draw;
	static offset = 64;
	static text_char_left = "<<";
	static text_char_right = ">>";
	static text_char_left_width = string_real_width(text_char_left, global._font_main_determination);
	static text_char_right_width = string_real_width(text_char_right, global._font_main_determination);
	static char_height = char_get_height("W");
	
	static update = function(position_x, position_y, menu_instance) {
		base_update(position_x, position_y, menu_instance);
		
		if (text_char_right_position_x == 0) {
			text_char_right_position_x = get_text_char_right_position_x(position_x, menu_instance);
		}
		
		var position_x_new = position_x + menu_instance.page_width + offset;
		var char_left_mouse_hover = point_in_rectangle_gui(position_x_new, position_y, position_x_new + text_char_left_width, position_y + char_height);
		var char_right_mouse_hover = point_in_rectangle_gui(text_char_right_position_x, position_y, text_char_right_position_x + text_char_right_width, position_y + char_height);
		
		if (char_left_mouse_hover && element != 0) {
			if (mouse_check_button_pressed(mb_left)) {
				element--;
				change_element(position_x, position_y, menu_instance);
			}
		}
		
		if (char_right_mouse_hover && element + 1 != elements_count) {
			if (mouse_check_button_pressed(mb_left)) {
				element++;
				change_element(position_x, position_y, menu_instance);
			}
		}
		
		if (!hover) return;
		
		element += menu_instance.input_h;
		
		if (element >= elements_count) {
			element = 0;
		}
		
		if (element < 0) {
			element = elements_count - 1;
		}
		
		if (menu_instance.input_h != 0) {
			change_element(position_x, position_y, menu_instance);
		}
	}
	
	static draw = function(position_x, position_y, menu_instance) {
		base_draw(position_x, position_y, menu_instance);
		
		var char_left  = element == 0 ? "" : text_char_left + " ";
		var char_right = element + 1 == elements_count ? "" : " " + text_char_right;
		text_shift = char_left + elements[element] + char_right;
		
		draw_reset();
		draw_set_font(global._font_main_determination);
		
		draw_text_outlined(position_x + menu_instance.page_width + offset, position_y, text_color, text_color_outline, text_shift);
		draw_reset();
	}
	
	static get_text_char_right_position_x = function(position_x, menu_instance) {
		var char_left  = element == 0 ? "" : text_char_left + " ";
		return position_x + menu_instance.page_width + offset + string_real_width(char_left + elements[element] + " ", global._font_main_determination);
	}
	
	static change_element = function(position_x, position_y, menu_instance) {
		audio_play_sound_plugging(snd_click);
		callback(element);
		text_char_right_position_x = get_text_char_right_position_x(position_x, menu_instance);
	}
}