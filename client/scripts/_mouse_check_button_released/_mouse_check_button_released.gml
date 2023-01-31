function __v_mouse_check_button_released(key, device_index = undefined) {
	if (is_desktop || device_index == undefined) return __mouse_check_button_released(key);
	if (is_mobile && device_index != undefined) {
		 return device_mouse_check_button_released(device_index, key);
	}
}

#macro __mouse_check_button_released mouse_check_button_released
#macro mouse_check_button_released __v_mouse_check_button_released
