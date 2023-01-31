/// @param array
function array_string_max_size(_array) {
	var	text_max = 0;
	for (var i = 0; i < array_length(array); i++) {
		var text_width = string_width(_array[i]);
		text_max = max(text_max, text_width);
	}
	return text_max;
}