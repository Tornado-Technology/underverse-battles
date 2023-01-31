function data_reset_protected() {
	if (file_exists(DATA_FILE_NAME)) {
		file_delete(DATA_FILE_PATH);
	}
	
	var template = file_text_read_all_strings(DATA_TEMPLATE_PATH);
	var encode = base64_encode(template);
	var file = file_text_open_write(DATA_FILE_PATH);
	file_text_write_string(file, encode);
	file_text_close(file);
}
