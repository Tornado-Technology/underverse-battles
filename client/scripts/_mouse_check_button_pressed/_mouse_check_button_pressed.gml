function __v_mouse_check_button_pressed(key, device_index = undefined) {
	if (is_desktop || device_index == undefined) return __mouse_check_button_pressed(key);
	if (is_mobile && device_index != undefined) {
		 return device_mouse_check_button_pressed(device_index, key);
	}
}

#macro __mouse_check_button_pressed mouse_check_button_pressed
#macro mouse_check_button_pressed __v_mouse_check_button_pressed
