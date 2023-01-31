/// @param {String} path
/// @desc Checks if the file exists; if it does not, it creates a new one
function file_verify(path) {
	if (file_exists(path)) return path;
	
	logger.info("file not founded");
	
	file_text_close(file_text_open_write(path));
	
	show_debug_message(file_exists(path));
	
	return path;
}
