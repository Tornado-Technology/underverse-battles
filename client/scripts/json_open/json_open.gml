/// @desc Read file and parse it to JSON.
/// @param {String} path - The path to file with JSON
function json_open(path) {
	var str = file_text_read_all_strings(path);
	
	try {
		return json_parse(str);
	} catch(error) {
		logger.warning("Json open failed, reason: \"{0}\" path: \"{1}\".", error.message, path);
		return json_parse("{ }");
	}
}  
