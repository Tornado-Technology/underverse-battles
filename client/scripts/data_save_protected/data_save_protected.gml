/// @desc
function data_save_protected() {
	logger.info("Protected-data saving...");
	var json = json_stringify(global.__data_save);
	var encode = base64_encode(json);
	var file = file_text_open_write(DATA_FILE_PATH);
	file_text_write_string(file, encode);
	file_text_close(file);
	logger.info("Protected-data saved successful!");
}
