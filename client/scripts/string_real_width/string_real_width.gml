/// @param {String} str
function string_real_width(str, font = draw_get_font()) {
	var result = 0;
	for (var i = 1; i <= string_length(str); i++) {
		result += char_get_width(string_char_at(str, i), font, i != string_length(str));
	}
	return result;
}
