function data_save() {
	if (DATA_ENCRIPTION) {
		logger.info("Data save used protected mode. (Safe)");
		data_save_protected();
		return;
	}
	
	logger.info("Data save used standart JSON mode. (Unsafe)");
	logger.info("Data saving...");
	var data = json_stringify(global.__data_save);
	var file = file_text_open_write(DATA_FILE_PATH);
	file_text_write_string(file, data);
	file_text_close(file);
	logger.info("Data saved successful!");
}
