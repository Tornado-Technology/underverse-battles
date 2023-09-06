function autolog_load() {
	if (!data_get("Settings.Data.Autolog")) return;
	
	if (!file_exists(network_autolog_file)) {
		logger.info("Auto-log: file not found");
		return;
	}
	
	try {
		var account_data = json_open(network_autolog_file);
		var username = account_data[$ "username"];
		var password = account_data[$ "password"];
		send_login(username, password);
		logger.info("Auto-log: request was sent successfully");
	} catch(error) {
		logger.error("Auto-log: ", error.message);
	}
}