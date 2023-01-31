function __v_mouse_check_button(key, device_index = undefined) {
	if (is_desktop || device_index == undefined) return __mouse_check_button(key);
	if (is_mobile && device_index != undefined) {
		 return device_mouse_check_button(device_index, key);
	}
}

#macro __mouse_check_button mouse_check_button
#macro mouse_check_button __v_mouse_check_button
