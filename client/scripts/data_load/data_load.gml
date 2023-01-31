function data_load() {
	if (DATA_ENCRIPTION) {
		logger.info("Data load used protected mode. (Safe)");
		data_load_protected();
		return;
	}
	
	logger.info("Data load used standart JSON mode. (Unsafe)");
	logger.info("Data loading...");
	var json = undefined;
	
	// Trying to boot
	try {
		json = json_open(DATA_FILE_PATH);
		logger.info("Data loaded successful!");
	} catch(error) {
		
		// A little bit of output to the console to track errors
		logger.error("Data load fail, reasone: {0}.", error.message);
		logger.warning("Data restoring...");
		
		// Trying to rebuild what was broken
		__data_try_create_directory();
		__data_try_create_file();
		
		// Trying to open the file again
		try {
			json = json_open(DATA_FILE_PATH);
			logger.info("Data restored successful!");
		} catch (error) {
			logger.fatal("Data file can't be retrieved, reasone: {0}.", error.message);
		}
	}
	
	// Load to our contanier
	global.__data_save = json;
	on_data_loaded.invoke();
}