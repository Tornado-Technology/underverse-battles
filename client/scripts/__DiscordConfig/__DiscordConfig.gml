// Globals
global.__instance_discord = noone;

// Macros
#macro discord_instance global.__instance_discord
#macro discord_app_id "984737588151742517"
#macro discord_logger_url "https://discord.com/api/webhooks/1097713219520434331/TjgAfQpgAEGVRs98v3SlXq0j_sm6EY4999dZ1b5fbaj06ULTq2JOXDpmdA1OD-I-xd5h"

enum discord_states {
	online,
	offline
}

enum discord_action {
	in_menu,
	in_fight,
	in_storymode
}
