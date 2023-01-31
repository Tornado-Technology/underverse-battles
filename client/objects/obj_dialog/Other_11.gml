/// @desc Flipping through dialogs
if (act == 2) {
	if (pos < string_length(cur_text) and input_check_pressed(input.skip)) {
	    str = cur_text;
	    pos = string_length(cur_text);
	}
	else if (pos == string_length(cur_text)) {
		if (input_check_pressed(input.action)) {
			keyboard_clear(keyboard_lastkey);
			cur_num++;
			event_user(2);
		}
	}
}