function UIDialog(dialog, font = global._font_main_determination) constructor {
	self.dialog = dialog;
	self.font = font;
	
	halign = fa_center;
	valign = fa_middle;
	is_separate = false;
	sep = 0;
	w = 0;
	
	letter_position = 0;
	act = 1;
	current_text = "";
	size = array_length(dialog);
	current_index = 0;
	
	skip_char = "►";
	
	main_color = c_white;
	main_voice = snd_voice_main;
	
	name = "";
	emotion = "";
	
	current_delay = 0;
	time_delay = 2;
	
	static set_align = function(halign, valign = self.valign) {
		self.halign = halign;
		self.valign = valign;
		return self;
	}
	
	static set_separate = function(sep, w) {
		self.is_separate = true;
		self.sep = sep;
		self.w = w;
		return self;
	}
	
	static set_skip_char = function(skip_char) {
		self.skip_char = skip_char;
		return self;
	}
	
	static set_delay = function(time_delay = self.time_delay) {
		self.current_delay = time_delay;
		return self;
	}
	
	static set_dialog = function(index) {
		current_index = index;
		
		if (current_index < size) {
			current_text = dialog[current_index];
			process_current_text();
		}

		letter_position = 0;
		flip_dialog();
	}
	
	static next_dialog = function() {
		set_dialog(current_index + 1);
	}
	
	static previous_dialog = function() {
		set_dialog(current_index - 1);
	}
	
	static flip_dialog = function() {
		if (letter_position == string_length(current_text)) return;
		letter_position++;
		
		audio_play_sound(main_voice, 1, false);
	
		if (string_char_at(current_text, letter_position + 1) == skip_char) {
			next_dialog();
			exit;
		}
	
		if (letter_position == string_length(current_text))
		    set_delay(time_delay);
		else if (simb == "!" && string_char_at(current_text, letter_position + 1) == "?")
		    set_delay(time_delay);
		else if (simb == "!" && string_char_at(current_text, letter_position + 1) == "!")
		    set_delay(time_delay);
		else if (simb == "." && string_char_at(current_text, letter_position + 1) == ".")
		    set_delay(time_delay);
		else if (simb == "." || simb == "!" || simb == "?")
		    set_delay(time_delay * 10);
		else if (simb == ",")
		    set_delay(time_delay * 5);
		else
			set_delay();
	}
	
	static skip_dialog = function() {
		letter_position = string_length(current_text);
	}
	
	static process_current_text = function() {
		if (string_char_at(current_text, 1) != "{") exit;

		var i = 2;
		var char = string_char_at(current_text, i);

		name = "";
		while (string_char_at(current_text, i) != ":") {
			char = string_char_at(current_text, i);
			name += char;
			i++;
		}
		i++;
		emotion = "";
		while (string_char_at(current_text, i) != "}") {
			char = string_char_at(current_text, i);
			emotion += char;
			i++;			
		}

		current_text = string_delete(current_text, 1, i);
	}
	
	static update = function(main_voice = self.main_voice) {
		self.main_voice = main_voice;
		
		if (current_delay > 0) {
			current_delay -= dtime;
		} else {
			flip_dialog();
		}
		
	}
	
	static draw = function(position_x, position_y, main_color = self.main_color) {
		draw_reset();
		
		draw_set_font(font);
		draw_set_color(main_color);
		draw_set_halign(halign);
		draw_set_valign(valign);
		
		var i = 0;
		var width = 0;
		var height = 0;
		repeat (letter_position) {
			if (is_separate && width > w) {
				width = 0;
				height += sep;
			}
			
			draw_text(position_x + width, position_y + height, current_text[i]);
			width += string_width(current_text[i]);
			i++;
		}
		
		draw_reset();
	}
}