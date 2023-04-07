// Abstract
function ClassMenuElement(key_translate) constructor {
	self.key_translate = key_translate;
	text = "";
	text_width = 0;
	text_color_transition = 0;
	shift_x = 0;
	hover = false;
	index = -1;
	text_color_render = c_white;
	on_click = function() {};
	on_focus = function() {};
	on_unfocus = function() {};
	is_shift = true;
	
	static text_color = c_white;
	static text_color_hover = c_purple;
	static text_color_outline = c_black;
	static text_color_transition_amount = 0.3;
	static text_height = char_get_height("W", font_determination);
	static shift_x_max = 15;
	static shift_amount = 0.5;
	
	static focus = function() {
		audio_play_sound(snd_click, 0, false);
		hover = true;
		on_focus();
	}
	
	static unfocus = function() {
		hover = false;
		on_unfocus();
	}
	
	static check_collision = function(position_x, position_y, menu_instance) {
		var new_mouse_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, position_x, position_y, position_x + text_width, position_y + text_height);
		
		if (menu_instance.element_mouse_index == index) {
			if (!new_mouse_hover) {
				menu_instance.change_element_mouse(-1);
			}
		}
		
		if (menu_instance.element_mouse_index == -1) {
			if (new_mouse_hover && (is_mobile ? mouse_check_button_pressed(mb_left) : true)) {
				menu_instance.change_element_mouse(index);
			}
		}
	}
	
	static update = function(position_x, position_y, menu_instance) {
		position_x += shift_x;
		
		if (hover) {
			var new_mouse_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, position_x, position_y, position_x + text_width, position_y + text_height);
			
			if (is_mobile ? mouse_check_button_released(mb_left) && new_mouse_hover : menu_instance.input_e) {
				on_click(menu_instance);
				return;
			}
		}
		change_shift();
		
		check_collision(position_x, position_y, menu_instance);
	}
	
	static change_shift = function() {
		if (!is_shift) return;
		
		shift_x = hover ? lerp(shift_x, shift_x_max, shift_amount) : lerp(shift_x, 0, shift_amount);
	}
	
	static draw = function(position_x, position_y, menu_instance) {
		position_x += shift_x;
		
		draw_reset();
		
		if (!string_is_empty(text)) {
			draw_set_font(font_determination);
			text_color_transition = lerp(text_color_transition, hover ? 1 : 0, text_color_transition_amount);
			text_color_render = merge_color(text_color, text_color_hover, text_color_transition);
			draw_text_outlined(position_x, position_y, text_color_render, text_color_outline, text);
			draw_reset();
		}
	}
	
	static translate_update = function() {
		text = translate_get("Menu." + key_translate);
		text_width = string_real_width(text, font_determination);
	}
}