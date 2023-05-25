exception_unhandled_handler(function(exception) {
	// Add version in crush
	var exception_message = sprintf("{0}\n{1}\n{2}", exception.longMessage, exception.script, string_join(exception.stacktrace, "\n"));
	var exception_hash = string_to_hash(exception_message);
	var base_message = sprintf("Unhandled exception:\n{0}\n\nOS: {1}\nVersion: {2}\nBuild: {3}\nHash: {4}", exception_message, os_get_name(os_type), game_version, game_build, exception_hash);
	var logging_error = sprintf("--------------------------------------------------------------\n{0}\n--------------------------------------------------------------\nPlease write to us about this:\nDiscord[Ru]: {1}\nDiscord[En]: {2}\n", base_message, url_discord_ru, url_discord_en);
	
	// Print some messages to the output log
    logger.error(logging_error);
	
	if (logging_to_discord) {
		send_discord_message(logging_discord_url, sprintf("Crash report: {0}", exception_hash), base_message);
	}
	
    // Write the exception struct to a file
	var file_name = working_directory + "crash" + string_replace_all(string_replace_all(date_datetime_string(date_current_datetime()), ":", "."), " ", "-") + ".txt";
    var file = file_text_open_write(file_name);
    file_text_write_string(file, base_message);
    file_text_close(file);

    // Show the error message (for debug purposes only)
	show_message(base_message);
});
