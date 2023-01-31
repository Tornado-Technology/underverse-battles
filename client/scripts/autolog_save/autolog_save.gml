/// @param {string} username
/// @param {string} password
function autolog_save(_username, _password) {
	if (!data_get("Settings.Data.Autolog")) return;
	
	var file_data = {
		username: _username,
		password: _password
	};
	
	var file = file_text_open_write(network_autolog_file);
	file_text_write_string(file, json_stringify(file_data));
	file_text_close(file);
	
	logger.info("Auto-log: Saved!");
}
