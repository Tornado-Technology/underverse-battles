/// @description Use for step-by-step load/initialization
/// If your initilization does not need it, declare an empty script
if (netlog_enabled) {
	instance_create(obj_netlog);
}

logger.info("Initilization start...");

audio_group_load_all();

input_init_bind_default();

data_load();
data_apply();

// After data loads
achivements_load();
background_load();
soundtrack_load();
translate_load();

if (is_desktop) {
	input_load();
}

// Create important objects
instance_create_array([
	obj_network_client,
	obj_camera,
	obj_ui_resource_usage
]);

if (is_desktop) {
	instance_create(obj_discord_rich);
}

// Character list load
CharacterList();
init_characters();

// After translate loads
if (is_desktop) {
	assets_load(); // Mods & Addons
	window_set_splash();
}

if (is_mobile) {
	instance_create(obj_yandex_ad_init);
}

// End
logger.info("Initilization done!")
room_goto(room_menu);
