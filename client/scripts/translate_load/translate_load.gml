/// @desc
function translate_load(apply_settings = true) {
	logger.info("Translate load languages.");
	global._translate_langs = is_mobile ? translate_languages_offical : file_finde_all("translate/*", fa_directory);
	logger.info($"Translate load {array_length(global._translate_langs)} languages.");
	
	if (apply_settings) {
		var lang_index = data_get("Settings.Language");
		translate_set_lang(lang_index);
	}
}