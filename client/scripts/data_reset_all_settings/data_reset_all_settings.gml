/// @param {Bool} hard
function data_reset_all_settings() {
	for (var i = 0; i < achievement_list_length - 1; i++) {
		global.__data_save[$ "Data"][$ "Achievements"][i] = false;
		global.__achievement_list[i].is_taken = false;
	}
	
	global.__data_save[$ "Settings"] = json_open(DATA_TEMPLATE_PATH)[$ "Settings"];
	
	var lang_index = data_get("Settings.Language");
	translate_set_lang(lang_index);
	if (is_desktop) window_set_fullscreen(data_get("Settings.Fullscreen"));
	
	data_reset_controls();

	room_goto(room);

}
