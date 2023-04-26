/// @param {String} str
function string_reverse(str) {
	var result = "";
	var lenght = string_length(str);
	
	for (var i = lenght; i > 0; i -= 2) {
		result += string_char_at(str, i);
		
		if (i - 1 > 0) {
			result += string_char_at(str, i - 1);
		}
	}
	
	return result;
}