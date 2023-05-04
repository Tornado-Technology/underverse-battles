#macro game_name "UnderverseBattles"
#macro game_version "v2.1.0"
#macro game_build "Windows x64"

#macro default_mode (os_get_config() == "Default")
#macro development_mode (os_get_config() == "Development")
#macro localserver_mode (os_get_config() == "Localserver")
#macro cinematic_mode (os_get_config() == "Cinematic")
#macro special_attack_test_mode (os_get_config() == "SpecialAttackTest")

// Used to test mobile features for Desktop
#macro mobile_mode false

#macro dtime delta_time / 1000000 * 60

enum particles_graphics_level {
	highly,
	medium,
	low,
	disabled,
}

#macro logging_enabled development_mode
#macro logging_to_file development_mode
#macro netlog_enabled development_mode
#macro netlog_ip "127.0.0.1"
#macro netlog_port 5101

// Data
#macro DATA_DIRECTORY "Savings"
#macro DATA_FILE_NAME "main.sv"
#macro DATA_ENCRIPTION true
#macro DATA_TEMPLATE_PATH "system/data.json"
#macro DATA_PATH game_save_id + DATA_DIRECTORY
#macro DATA_FILE_PATH DATA_PATH + "/" + DATA_FILE_NAME
global.__data_save = undefined;
global.fight_instance = noone;
fight_network_mode = false;
