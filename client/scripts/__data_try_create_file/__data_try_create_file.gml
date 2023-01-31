function __data_try_create_file() { 
	file_verify(DATA_FILE_PATH);
	var data = file_text_read_all_strings(DATA_TEMPLATE_PATH);
	var file = file_text_open_write(DATA_FILE_PATH);
	file_text_write_string(file, data);
	file_text_close(file);
}