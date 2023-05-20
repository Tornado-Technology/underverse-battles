/// @desc Flipping through dialogs
if (act != 2) exit;

if (pos < string_length(cur_text)) {
	if (input_check_pressed(input.skip)) {
		str = cur_text;
		pos = string_length(cur_text);
	}
	exit;
}

if (input_check_pressed(input.action)) {
	next_dialog();
}