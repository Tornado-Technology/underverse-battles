function UIDialog(dialog, font = global._font_main_determination) constructor {
	self.dialog = dialog;
	self.font = font;
	
	is_separate = false;
	sep = 0;
	w = 0;
	
	letter_position = 0;
	current_text = dialog[0];
	size = array_length(dialog);
	current_index = 0;
	
	skip_char = "►";
	
	main_color = c_white;
	main_voice = snd_voice_main;
	
	name = "";
	emotion = "";
	
	current_delay = 0;
	time_delay = 1;
	
	final_action = function() {}
	
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
	
	static set_voice = function(main_voice) {
		self.main_voice = main_voice;
	}
	
	static set_final_action = function(callback) {
		self.final_action = callback;
		return self;
	}
	
	static is_flipping = function() {
		return letter_position < string_length(current_text);
	}
	
	static is_final_text = function() {
		return current_index == size - 1;
	}
	
	static set_new_dialog = function(dialog) {
		self.dialog = dialog;
		size = array_length(dialog);
		set_dialog(0);
	}
	
	static set_dialog = function(index) {
		letter_position = 0;
		current_index = index;
		
		if (current_index < size) {
			current_text = dialog[current_index];
		} else {
			final_action();
		}
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
		
		var simb = string_char_at(current_text, letter_position);
	
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
		
		if (string_char_at(current_text, letter_position) == skip_char) {
			next_dialog();
			exit;
		}
	}
	
	static process_current_text = function(callback) {
		if (letter_position != 0) exit;
		
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
		callback();
	}
	
	static update = function() {
		if (current_delay > 0) {
			current_delay -= dtime;
		} else {
			flip_dialog();
		}
		
	}
	
	static draw = function(position_x, position_y, main_color = self.main_color, font = self.font) {
		draw_reset();
		
		draw_set_font(font);
		draw_set_color(main_color);
		
		var visible_text = string_copy(current_text, 0, letter_position);
		if (is_separate)
			draw_text_ext(position_x, position_y, visible_text, sep, w);
		else
			draw_text(position_x, position_y, visible_text);
		
		draw_reset();
	}
}