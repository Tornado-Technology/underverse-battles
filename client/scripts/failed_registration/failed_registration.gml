function failed_registration(reason){
	global.failed_registration = true;
	display_show_message_info(translate_get("Menu.Notifications.Error." + string(reason)), c_red);
}