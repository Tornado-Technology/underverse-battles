time_source_destroy(time_source_restart);

if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = false;
}

global.gameplay_instance = noone;