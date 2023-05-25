/// @description Returns whether the specified [substr] is contained in [str].
/// @param {String} str The line in which the search takes place
/// @param {String} substr Search string
/// @param {Real} start_pos Starting position for the search
function string_contains(str, substr, start_pos = 1) {
	return string_pos_ext(substr, str, start_pos) > 0;
}
