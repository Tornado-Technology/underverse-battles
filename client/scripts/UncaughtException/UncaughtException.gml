exception_unhandled_handler(function(exception) {
	// Add version in crush
	var exception_message = $"{exception.longMessage}\n{exception.script}\n{string_join(exception.stacktrace, "\n")}";
	var exception_hash = string_to_hash(exception_message);
	var base_message = $"Unhandled exception:\n{exception_message}\n\nOS: {os_get_name(os_type)}\nVersion: {game_version}\nBuild: {game_build}\nHash: {exception_hash}";
	var logging_error = $"--------------------------------------------------------------\n{base_message}\n--------------------------------------------------------------\nPlease write to us about this:\nDiscord[Ru]: {url_discord_ru}\nDiscord[En]: {url_discord_en}\n";
	
	// Print some messages to the output log
    logger.error(logging_error);
	
	if (logging_to_discord) {
		send_discord_message(logging_discord_url, $"Crash report: {exception_hash}", base_message);
	}
	
    // Write the exception struct to a file
	var file_name = $"{working_directory}crash{string_replace_all(string_replace_all(date_datetime_string(date_current_datetime()), ":", "."), " ", "-") + ".txt"}";
    var file = file_text_open_write(file_name);
    file_text_write_string(file, base_message);
    file_text_close(file);

    // Show the error message (for debug purposes only)
	show_message(base_message);
});


