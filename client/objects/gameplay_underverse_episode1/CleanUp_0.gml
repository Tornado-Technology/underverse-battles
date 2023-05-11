if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = false;
}

camera_set_position(0, 0);

time_source_destroy(time_source_restart);