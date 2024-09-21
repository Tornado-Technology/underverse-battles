function invalid_registration(){
	global.failed_registration = true;
	display_show_message_info(translate_get("Menu.Notifications.RegistrationInvalid"), c_red);
}