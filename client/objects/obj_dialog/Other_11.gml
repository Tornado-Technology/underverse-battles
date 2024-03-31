/// @desc Flipping through dialogs
if (act != 2) exit;

if (pos < string_length(cur_text)) {
	if (input_check_pressed(input.skip)) {
		logger.debug(string_char_at(cur_text, string_length(cur_text) - 1));
		if (string_char_at(cur_text, string_length(cur_text)) == skip_simb) {
			next_dialog();
			exit;
		}
		str = cur_text;
		pos = string_length(cur_text);
	}
	exit;
}

if (input_check_pressed(input.action)) {
	next_dialog();
}