/// @description
/// Return: Hexadecimal string.
/// @param {Real} value - A positive integer, attempts to feed other numbers will cause the project to crash.
/// @param {Real} length - The total length of the string. Extra characters will be filled with 0.
/// @return {String}
function convert_dec_to_hex(value, length = undefined) {
	if (value < 0) {
		logger.fatal("Incorrect value `{0}` of argument `value` function `convert_dec_to_hex` takes only positive integers.", value);
		return "";
	}
	
	var all_chars = "0123456789ABCDEF";
	var hex = "";

	do {
	    var n = value & $f;
	    hex = string_char_at(all_chars, n + 1) + hex;
	    value = value >> 4;
	} until (value == 0);

	if (length != undefined) {
	    while (string_length(hex) < length) {
	        hex = "0" + string(hex);
	    }
	}

	return hex;
}
