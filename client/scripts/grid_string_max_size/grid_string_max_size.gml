/// @param grid
/// @param id
function grid_string_max_size(_grid, _id = 0) {
	var	text_max = 0;
	for (var i = 0; i < ds_grid_height(_grid); i++) {
		var text_width = string_width(_grid[# _id, i]);
		text_max = max(text_max, text_width);
	}
	return text_max;
}