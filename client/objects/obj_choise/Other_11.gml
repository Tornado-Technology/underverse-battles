/// @desc Use choise
if (act == 2) {
	if (pos < string_length(cur_text) and input_check_pressed(input.skip)) {
	    str = cur_text;
	    pos = string_length(cur_text);
	}
	else if (pos == string_length(cur_text)) {
		
		if (input_check_pressed(input.left)) {
			if (current_option > 0) {
				input_on_press(-1);
			}
		}
		if (input_check_pressed(input.right)) {
			if (current_option < answers_amount - 1) {
				input_on_press(1);
			}
		}
		if (input_check_pressed(input.action)) {
			callback(current_option);
			audio_play_sound_plugging(snd_selection);
			instance_destroy();
		}
	}
}