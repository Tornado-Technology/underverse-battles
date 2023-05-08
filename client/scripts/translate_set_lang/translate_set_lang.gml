/// @param {Real} lang_id
function translate_set_lang(lang_id) {
	if (!translate_lang_exists(lang_id)) { 
		logger.warning("current \"lang_id\" not exists, id: {0}.", lang_id);
		return;
	}
	
	var root = global._translate_langs[lang_id];
	var json = json_open(translate_directory + root + "/" + translate_language_main);
	var info = json_open(translate_directory + root + "/" + translate_language_info);

	// Set globals...
	global.__translate_lang_id = lang_id;
	global.__translate_lang_json = json;
	global.__translate_lang_info = info;
	
	translate_set_font(lang_id);
	
	logger.info("Translate set new language: {0}.", lang_id);
	
	on_translate_update.invoke();
	
	if (is_mobile) {
		global.__data_save.Settings.Language = global.__translate_lang_id;
		data_save();
	}
}
