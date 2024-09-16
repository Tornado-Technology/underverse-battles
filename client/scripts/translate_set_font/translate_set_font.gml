/// @param {Real} lang_id
function translate_set_font(lang_id) {
	if (lang_id == 2) {
		global._font_main_determination = font_determination_ukranian;
		global._font_main_mini = font_mini;
		global._font_main_comic_sans = font_determination_ukranian;
		global._font_main_papyrus = font_papyrus;
	}
	else if (lang_id == 3) {
		global._font_main_determination = font_determination_zn_ch;
		global._font_main_mini = font_mini_zn_ch;
		global._font_main_comic_sans = font_comic_sans_zn_ch;
		global._font_main_papyrus = font_papyrus_zn_ch;
	}
	else {
		global._font_main_determination = font_determination;
		global._font_main_mini = font_mini;
		global._font_main_comic_sans = font_comic_sans;
		global._font_main_papyrus = font_papyrus;
	}
}