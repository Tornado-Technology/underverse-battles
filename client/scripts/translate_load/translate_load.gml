/// @desc
function translate_load(apply_settings = true) {
	logger.info("Translate load langs.");
	global._translate_langs = is_mobile ? translate_languages_offical : file_finde_all("translate/*", fa_directory);
	logger.info("Translate load {0}/{0} langs.", array_length(global._translate_langs));
	
	if (apply_settings) {
		var lang_index = data_get("Settings.Language");
		translate_set_lang(lang_index);
		translate_set_font(lang_index);
	}
}