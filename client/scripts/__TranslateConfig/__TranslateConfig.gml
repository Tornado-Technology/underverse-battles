// Globals
global.__translate_lang_id = 0;
global.__translate_lang_json = undefined;
global.__translate_lang_info = undefined;
global.__event_on_translate_update = new Event();

// Macros
#macro on_translate_update global.__event_on_translate_update
#macro translate_directory "translate/"
#macro translate_language_info "info.json"
#macro translate_language_main "translate.json"
#macro translate_languages_offical ["en_us", "ru_ru"]

// Connections
on_translate_update.connect(discrod_update_translate);
on_translate_update.connect(achievements_translate_update);
on_translate_update.connect(backgrounds_translate_update);
