// Globals
global.__instance_discord = noone;

// Macros
#macro discord_instance global.__instance_discord
#macro discord_app_id "984737588151742517"

enum discord_states {
	online,
	offline
}

enum discord_action {
	in_menu,
	in_fight,
	in_storymode
}
