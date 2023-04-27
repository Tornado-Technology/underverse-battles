exception_unhandled_handler(function(exception) {
	// Add version in crush
	var msg = sprintf("--------------------------------------------------------------\n Unhandled exception: \n{0}\n{1}\n{2}\n\nOS: {3}\nVersion: {4}\nBuild: {5}\n--------------------------------------------------------------\nPlease write to us about this:\nDiscord[Ru]: {6}\nDiscord[En]: {7}\n",
	 exception.longMessage, exception.script, string_join(exception.stacktrace, "\n"), os_get_name(os_type), game_version, game_build, url_discord_ru, url_discord_en);
	// Print some messages to the output log
    logger.error(msg);
	
	var msg_for_discord = sprintf("--------------------------------------------------------------\n Unhandled exception: \n{0}\n{1}\n{2}\n\nOS: {3}\nVersion: {4}\nBuild: {5}\n--------------------------------------------------------------\n",
	 exception.longMessage, exception.script, string_join(exception.stacktrace, "\n"), os_get_name(os_type), game_version, game_build);
	send_message_in_discord(msg_for_discord);

    // Write the exception struct to a file
	var file_name = working_directory + "crash" + string_replace_all(string_replace_all(date_datetime_string(date_current_datetime()), ":", "."), " ", "-") + ".txt";
    var file = file_text_open_write(file_name);
	
    file_text_write_string(file, msg);
    file_text_close(file);

    // Show the error message (for debug purposes only)
	show_message(msg);
	
	if (is_mobile) {
		show_message_async(msg)
	}
});