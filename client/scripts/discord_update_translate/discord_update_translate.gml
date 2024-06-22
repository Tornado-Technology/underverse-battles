function discrod_update_translate() {
	var discord = discord_instance;
	if (discord == noone) {
		return;
	}
	
	discord_set_info_action(discord.info_action);
	discord_set_info_state(discord.info_state);
	
	discord.update();
}
