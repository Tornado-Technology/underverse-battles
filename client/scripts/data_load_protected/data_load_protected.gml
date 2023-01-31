/// @desc
function data_load_protected() {
	logger.info("Protected-data loading...");
	var decoded = undefined;
	var data = undefined;
	var json = undefined;

	// Trying to boot
	try {
		data = file_text_read_all_strings(DATA_FILE_PATH);
		decoded = base64_decode(data);
		json = json_parse(decoded);
		logger.info("Protected-data loaded successful!");
	} catch(error) {
		// A little bit of output to the console to track errors
		logger.error("Protected-data load fail, reasone: {0}.", error.message);
		logger.warning("Protected-data restoring...");
		
		// Trying to rebuild what was broken
		directory_verify(DATA_DIRECTORY);
		file_verify(DATA_FILE_PATH);
		
		var template = file_text_read_all_strings(DATA_TEMPLATE_PATH);
		var encode = base64_encode(template);
		var file = file_text_open_write(DATA_FILE_PATH);
		file_text_write_string(file, encode);
		file_text_close(file);
		
		// Trying to open the file again
		try {
			data = file_text_read_all_strings(DATA_FILE_PATH);
			decoded = base64_decode(data);
			json = json_parse(decoded);
			logger.info("Protected-data restored successful.");
		} catch (error) {
			logger.fatal("Protectedd-data file can't be retrieved, reasone: {0}.", error.message);
		}
	}
	
	// Load to our contanier
	global.__data_save = json;
	on_data_loaded.invoke();
}
