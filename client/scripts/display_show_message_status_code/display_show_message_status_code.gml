function display_show_message_status_code(send_code, comparing_code, key, color = c_white, time_max = 160, callback = function() {}) {
	if (send_code == comparing_code) {
		display_show_message_info(translate_get(key), "Menu.Notifications." + color, time_max);
		callback();
	}
}