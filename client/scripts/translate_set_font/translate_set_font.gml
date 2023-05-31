/// @param {Real} lang_id
function translate_set_font(lang_id) {
	if (lang_id == 2) {
		global._font_main_determination = font_determination_zn_ch;
		global._font_main_mini = font_mini_zn_ch;
		global._font_main_comic_sans = font_determination_zn_ch;
		return;
	}
	
	global._font_main_determination = font_determination;
	global._font_main_mini = font_mini;
	global._font_main_comic_sans = font_comic_sans;
}