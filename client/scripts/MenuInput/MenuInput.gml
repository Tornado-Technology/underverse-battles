function MenuInput(key_translate, input) {
	var instance = new ClassMenuInput(key_translate, input);
	instance.translate_update();
	
	return instance;
}

function ClassMenuInput(key_translate, input) : ClassMenuElement(key_translate) constructor {
	self.input = input;
	is_shift = false;
	is_input_waiting = false;
	static base_update = update;
	static base_draw = draw;
	static offset_from_main_text = 64;
	static char_height = char_get_height("W");
	static text_color_enabled = c_white;
	static text_color_disabled = c_dkgray;
	
	
	static update = function(position_x, position_y, menu_instance) {
		base_update(position_x, position_y, menu_instance);
		
		if (!hover) return;
		
		if (is_input_waiting) {
			if (input_check_pressed(input.anykey)) {
				var key = Key(device.keyboard, keyboard_key);
				if (!key_vaild(key.value)) {
					display_show_message_info(translate_get("Menu.Control.Message.Forbidden"), c_red);
					return;
				}
				if (has_key_inputs(key)) {
					display_show_message_info(translate_get("Menu.Control.Message.Binded"), c_red);
					return;
				}
				input_bind(self.input, key);
				is_input_waiting = false;
				menu_instance.input_is_locked = false;
				
				keyboard_clear_lastkey();
				return;
			}
		}
		
		if (menu_instance.input_e == 0) return;
		if (is_input_waiting) return;
		
		is_input_waiting = true;
		menu_instance.input_is_locked = true;
	}
	
	static draw = function(position_x, position_y, menu_instance) {
		base_draw(position_x, position_y, menu_instance);
		
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		
		draw_reset();
		draw_set_font(global._font_main_determination);
		
		var text_input = chr(input_get_working_key(self.input).value);
		
		if (is_input_waiting) text_input = "_";
		
		draw_text_outlined(new_position_x, position_y, text_color, text_color_outline, text_input);
		
		draw_reset();
	}
}