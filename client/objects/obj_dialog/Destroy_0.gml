if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = true;
}

if (death_name_function == "") exit;

script_execute(death_name_function);