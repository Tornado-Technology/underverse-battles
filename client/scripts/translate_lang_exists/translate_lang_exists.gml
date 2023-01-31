/// @param {real} lang_id
function translate_lang_exists(_lang_id) {
	return (_lang_id > -1) && (_lang_id < translate_get_lang_count()); 
}
