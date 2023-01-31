function UISlider(start_value, callback = function() {}) {
	var instance = new ClassUISlider(start_value, callback);
	
	return instance;
}

function ClassUISlider(start_value, callback) constructor {
	self.callback = callback;
	is_enable = true;
	value = start_value;
	slider_time = 0;
	last_mouse_hold = false;
	length = 64;
	static radius = 4;
	static line_width = 2;
	slider_delay = 20;
	text_color = c_white;
	text_color_outline = c_black;
	
	static update = function(position_x, position_y) {
		var circle_x = position_x + (length * value);
		
		var mouse_hover_circle = point_in_circle_gui(circle_x, position_y, radius);
		var mouse_hover_line = point_in_rectangle_gui(position_x, position_y, position_x + length, position_y + line_width);
		var input_wheel = mouse_wheel_up() - mouse_wheel_down();
		
		if (mouse_hover_circle || mouse_hover_line) {
			if (input_wheel != 0) {
				change_value(value + input_wheel / 100);
			}
		}
		
		if (mouse_hover_circle || last_mouse_hold) {
			if (mouse_check_button(mb_left)) {
				last_mouse_hold = true;
				var new_value = (mouse_gui_x - position_x) / length;
				
				if (new_value != value) {
					change_value(new_value);
				}
			} else {
				last_mouse_hold = false;
			}
		}
	}
	
	static draw = function(position_x, position_y) {
		if (is_enable) update(position_x, position_y);
		
		draw_reset();
		draw_set_font(font_determination);
		
		var circle_x = position_x + (length * value);
			
		draw_set_color(c_black);
		draw_line_width(position_x - 1, position_y, position_x + length + 1, position_y, line_width + 2);
		draw_set_color(c_white);
		draw_line_width(position_x, position_y, position_x + length, position_y, line_width);
		draw_set_color(c_black);
		draw_circle(circle_x, position_y, radius, false);
		draw_set_color(c_white);
		draw_circle(circle_x, position_y, radius - 1, false);
		draw_text_outlined(position_x + (length * 1.2), position_y - 7, text_color, text_color_outline, string(floor(value * 100)) + "%");
		
		draw_reset();
	}
	
	static change_value = function(new_value, is_play_sound = true) {
		if (new_value > 1 || new_value < 0) {
			value = clamp(new_value, 0, 1);
			callback(value);
			return;
		}
		
		if (is_play_sound) { audio_play_sound_once(snd_tick, 1); }
		
		value = new_value;
		value = clamp(value, 0, 1);
		callback(value);
	}
}