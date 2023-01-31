/// @func data_reset_settings()
function data_reset_settings() {
	global.__data_save[$ "Settings"] = json_open(DATA_TEMPLATE_PATH)[$ "Settings"];
	translate_set_lang(data_get("Settings.Language"));
	if (is_desktop) window_set_fullscreen(data_get("Settings.Fullscreen"));
	room_goto(room);
}
