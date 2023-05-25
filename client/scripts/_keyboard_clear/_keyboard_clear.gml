function __v_keyboard_clear(key) {
	if (!variable_global_exists("keyboard_list_clear_keys")) {
		global.keyboard_list_clear_keys = [];
	}
	
	if (array_includes(global.keyboard_list_clear_keys, key)) return;
	
	array_push(global.keyboard_list_clear_keys, key);
}

#macro __keyboard_clear keyboard_clear
#macro keyboard_clear __v_keyboard_clear