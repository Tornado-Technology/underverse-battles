// Main game information
#macro game_name "UnderverseBattles"
#macro game_version "v2.1.7"
#macro game_base_fps 60

// Builds
#macro game_build (os_type == os_windows ? "Windows x64" : (os_type == os_macosx ? "MacOS" : (os_type == os_linux ? "Linux" : (os_type == os_android ? "Android" : (os_type == os_ios ? "iOS" : "Undefined")))))

// Game mode macros
#macro default_mode (os_get_config() == "Default")
#macro development_mode (os_get_config() != "Default" && os_get_config() != "Tournament")
#macro localserver_mode (os_get_config() == "Localserver")
#macro cinematic_mode (os_get_config() == "Cinematic")
#macro mobile_mode (os_get_config() == "Mobile")
#macro tournament_mode (os_get_config() == "Tournament")

// Logger
#macro logging_discord_url "https://discord.com/api/webhooks/1103616545084678214/M45_mY8SdxoivonuaWhC1FSI6J5-PBE92a5H_gXtDVhLp5vRyAKzqukD3i5AKvR6_Xf4"
#macro logging_enabled development_mode
#macro logging_to_file development_mode
#macro logging_to_discord true
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

#macro dtime (delta_time / 1000000 * game_base_fps)

global.__data_save = undefined;
global.fight_instance = noone;
global.pause_game = false;
fight_network_mode = false;
