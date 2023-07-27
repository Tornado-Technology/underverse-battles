/// @description Connecting
if (discord_instance != noone) {
	throw new Exception();
}

// Connecting
if (np_initdiscord(discord_app_id, false, np_steam_app_id_empty)) {
	logger.info("Discord Rich start");
} else {
	logger.error("Discord Rich start failed")
	exit;
}

discord_instance = id;

img_large = "default";
img_small = "";

// Text fields
desc_small = "";
desc_large = "";
info_state = discord_states.offline;
info_action = discord_action.in_menu;
text_info_state = "";
text_info_action = "";

update = function() {
	np_setpresence(text_info_state, text_info_action, img_large, img_small);
}

// Fill fields
discord_set_info_action(discord_action.in_menu);
discord_set_info_state(discord_states.online);

into_menu_handler = on_into_menu.connect(function() {
	discord_set_info_action(discord_action.in_menu);
});

into_fight_handler = on_into_fight.connect(function(enemy) {
	discord_set_info_action(discord_action.in_fight);
	text_info_action += string(enemy);
});

into_story_mode_handler = on_into_story_mode.connect(function(name) {
	discord_set_info_action(discord_action.in_storymode);
	text_info_action += string(name);
});

