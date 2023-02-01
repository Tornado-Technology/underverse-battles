/// @desc Limits the string length
/// @param {String} str - The target string to clamp
/// @param {Real} length - The desired new string length
/// @param {String} ending - The new string ending
function string_clamp(str, length, ending = ""){
	return string_length(str) <= length ? str : string_copy(str, 1, length - string_length(ending)) + ending;
}
	