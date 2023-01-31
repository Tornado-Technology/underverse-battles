/// @desc
function data_apply() {
	if (is_desktop) { 
		window_set_fullscreen(data_get("Settings.Fullscreen"));
	}
	
	audio_group_set_gain(music, data_get("Settings.Gain.Music"), 0);
	audio_group_set_gain(sound, data_get("Settings.Gain.Sound"), 0);
	audio_group_set_gain(menu_music, data_get("Settings.Gain.MenuMusic"), 0);
}