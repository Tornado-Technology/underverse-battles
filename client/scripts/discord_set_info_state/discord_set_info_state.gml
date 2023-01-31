/// @param state
function discord_set_info_state(info_state) {
	var value = translate_get("DiscordApp.Undefined");
	
	switch (info_state) {
		case discord_states.online:
			value = translate_get("DiscordApp.States.Online");
			break;
			
		case discord_states.offline:
			value = translate_get("DiscordApp.States.Offline");
			break;
	}

	discord_instance.info_state = info_state;
	discord_instance.text_info_state = value;
	discord_instance.update();
	logger.debug("Set new discord state info.");
}
