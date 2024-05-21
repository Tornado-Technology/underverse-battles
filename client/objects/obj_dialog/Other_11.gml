/// @desc Flip dialog
if (act != 2) exit;

if (string_char_at(cur_text, string_length(cur_text)) == skip_simb) {
	next_dialog();
}