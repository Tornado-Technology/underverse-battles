/// @param action
function discord_set_info_action(info_action) {
	if (!is_desktop) return;
	
	var value = translate_get("DiscordApp.Undefined");
	switch (info_action) {
		case discord_action.in_menu:
			value = translate_get("DiscordApp.Actions.InMenu");
			break;

		case discord_action.in_fight:
			value = translate_get("DiscordApp.Actions.InFight");
			break;

		case discord_action.in_storymode:
			value = translate_get("DiscordApp.Actions.InStorymode");
			break;
	}
	
	discord_instance.info_action = info_action;
	discord_instance.text_info_action = value;
	discord_instance.update();
	logger.debug("Set new discord action info.");
}