/// @description Use for step-by-step load/initialization
/// If your initilization does not need it, declare an empty script
gc_enable(false);

if (netlog_enabled) {
	instance_create(obj_netlog);
}

logger.info("Initilization start...");

// Audio
audio_group_load_all();
load_all_soundtracks();

// Bind
input_init_bind_default();

// Data
data_load();
data_apply();

// Audio
audio_listener_orientation(0, 0, 1, 0, -1, 0);
audio_falloff_set_model(audio_falloff_linear_distance);

// Discord rich
if (is_desktop) {
	instance_create(obj_discord_rich);
}

// After data loads
achivements_load();
background_load();
soundtrack_load();
translate_load();

// Random set
global.seed = randomize();
global.max_seed = 4294967296;

if (is_desktop) {
	input_load();
}

// Create important objects
instance_create_array([
	obj_network_client,
	obj_camera,
	obj_ui_resource_usage
]);

// Character list load
CharacterList();
init_characters();

// After translate loads
if (is_desktop) {
	assets_load(); // Mods & Addons
	window_set_splash();
}

// Ad
if (is_mobile) {
	instance_create(obj_yandex_ad_init);
}

// End
logger.info("Initilization done!")
room_goto(room_menu);
