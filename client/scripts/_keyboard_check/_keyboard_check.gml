function __v_keyboard_check(key) {
	if (!variable_global_exists("keyboard_list_clear_keys")) {
		global.keyboard_list_clear_keys = [];
	}
	
	if (array_has(global.keyboard_list_clear_keys, key)) return false;
	
	return __keyboard_check(key);
}

#macro __keyboard_check keyboard_check
#macro keyboard_check __v_keyboard_check
