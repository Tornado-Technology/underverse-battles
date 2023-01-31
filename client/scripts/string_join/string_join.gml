/// @desc Combines array elements via delemiter.
/// @param {Array<Any>} array - The array to join
/// @param {String} delemiter - The string of the interval where the elements will be connected
/// @return {String}
function string_join(array, delemiter) {
	var result = "";
	var length = array_length(array);
	for (var i = 0; i < length; i++) {
		result += string(array[i]);
		
		if (i != length - 1) {
			result += delemiter;
		}
	}
	return result;
}
