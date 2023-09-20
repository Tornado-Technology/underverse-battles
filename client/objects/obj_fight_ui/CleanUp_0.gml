if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = false;
	global.__ui_virtual_buttons_instance.is_enable = false;
	global.__ui_controls_instance.get_controller().reset_index();
	global.__ui_controls_instance.get_controller().input_pressed = undefined;
};