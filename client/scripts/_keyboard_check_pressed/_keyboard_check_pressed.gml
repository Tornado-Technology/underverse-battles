function __v_keyboard_check_pressed(key) {
	if (!variable_global_exists("keyboard_list_clear_keys")) {
		global.keyboard_list_clear_keys = [];
	}
	
	if (array_includes(global.keyboard_list_clear_keys, key)) return false;
	
	return __keyboard_check_pressed(key);
}

#macro __keyboard_check_pressed keyboard_check_pressed
#macro keyboard_check_pressed __v_keyboard_check_pressed