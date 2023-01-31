/// @desc Data Save (All)
logger.info("Start saving data");

try {
	for (var i = 0; i < achievement_list_length; i++) {
		global.__data_save[$ "Data"][$ "Achievements"][i] = global.__achievement_list[i].is_taken;
	}
} catch (e) {
	global.__data_save[$ "Data"][$ "Achievements"] = [];
	for (var i = 0; i < achievement_list_length; i++) {
		global.__data_save[$ "Data"][$ "Achievements"][i] = global.__achievement_list[i].is_taken;
	}
}

if (is_desktop) global.__data_save.Settings.Fullscreen = window_get_fullscreen();
global.__data_save.Settings.Language = global.__translate_lang_id;

data_save(); // Saving all data
