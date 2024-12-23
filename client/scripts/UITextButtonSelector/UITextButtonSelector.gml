function UITextButtonSelector(button_texts, scroll_up_input = input.up, scroll_down_input = input.down, current_option = 0) constructor {
	self.scroll_up_input = scroll_up_input;
	self.scroll_down_input = scroll_down_input;
	self.current_option = current_option;
	
	count = array_length(button_texts);
	
	var i = 0;
	repeat (count) {
		button[i] = new UITextButton(i, button_texts[i])
			.set_padding(5)
			.set_needs_focus(true)
			.set_on_hover(function(self_button) {
				button[current_option].set_focus(false);
				current_option = self_button.index;
			});
		i++;
	}
	
	static set_padding = function(padding) {
		var i = 0;
		repeat (count) {
			button[i].padding = padding;
			i++;
		}
		return self;
	}
	
	static set_color = function(text_color, text_hover_color) {
		var i = 0;
		repeat (count) {
			button[i].text_color = text_color;
			button[i].text_hover_color = text_hover_color;
			i++;
		}
		return self;
	}
	
	static set_align = function(halign, valign = button[0].valign) {
		var i = 0;
		repeat (count) {
			button[i].halign = halign;
			button[i].valign = valign;
			i++;
		}
		return self;
	}
	
	static set_separate = function(sep, w) {
		var i = 0;
		repeat (count) {
			button[i].is_separate = true;
			button[i].sep = sep;
			button[i].w = w;
			i++;
		}
		return self;
	}
	
	static set_bind_input = function(bind) {
		var i = 0;
		repeat (count) {
			button[i].set_bind_input(bind);
			i++;
		}
		return self;
	}
	
	static set_on_hold = function(callback) {
		var i = 0;
		repeat (count) {
			button[i].set_on_hold(callback);
			i++;
		}
		return self;
	}
	
	static set_on_press = function(callback) {
		var i = 0;
		repeat (count) {
			button[i].set_on_press(callback);
			i++;
		}
		return self;
	}
	
	static set_on_release = function(callback) {
		var i = 0;
		repeat (count) {
			button[i].set_on_release(callback);
			i++;
		}
		return self;
	}
	
	static set_focus = function(index = 0) {
		if (is_desktop) {
			current_option = index;
			button[index].focus();
		}
		return self;
	}
	
	static update = function() {
		if (input_check_pressed(scroll_up_input) || mouse_wheel_up()) {
			if (current_option > 0) {
				scroll(-1);
			} else {
				scroll(count - 1);
			}
		}
		if (input_check_pressed(scroll_down_input) || mouse_wheel_down()) {
			if (current_option < count - 1) {
				scroll(1);
			} else {
				scroll(1 - count);
			}
		}
	}
	
	static draw = function(index, position_x, position_y) {
		button[index].draw(position_x, position_y);
	}
	
	static scroll = function(amount) {
		audio_play_sound_once(snd_click);
	
		if (!button[current_option].focus) {
			button[current_option].set_focus(true);
			return;
		}

		button[current_option].set_focus(false);
		current_option += amount;
		button[current_option].set_focus(true);
	}
}