global.gameplay_instance = noone;

if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = false;
	global.__ui_virtual_buttons_instance.is_enable = false;
}