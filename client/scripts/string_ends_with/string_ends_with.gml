/// @desc Checks whether the specified string ends with the specified [end_with].
/// @param {String} str - The string to check
/// @param {String} end - The string to look for
function string_ends_with(str, end_with) {
	var pos = string_pos(end_with, str);
	return pos > 0 && pos == (string_length(str) - string_length(end_with) + 1);
}
