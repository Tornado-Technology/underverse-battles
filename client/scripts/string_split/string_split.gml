/// @description Divides a string into an array of strings using a delimiter.
/// @param {String} str - Separation string
/// @param {String} delemiter - Delemiter by which a string will be separated
/// @return {Array<String>}
function string_split(str, delemiter = ":") {
	var result = [];
	var position = string_pos(delemiter, str);
	var position_old = 1;
	var delemiter_length = string_length(delemiter);
	
	if (delemiter_length) {
		while (position) {
			array_push(result, string_copy(str, position_old, position - position_old));
			position_old = position + delemiter_length;
			position = string_pos_ext(delemiter, str, position_old);
		}
	}
	
	array_push(result, string_delete(str, 1, position_old - 1));
	return result;
}
