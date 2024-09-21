function failed_registration_reason_second_password() {
	global.failed_registration = true;
	display_show_message_info(translate_get("Menu.Notifications.ErrorSecondPassword"), c_red);
}