if (global.successful_registration) {
	show_loading = false;
	buttons_show = true;
	global.successful_registration = false;
	menu_switch_pause(false);
}

if (global.failed_registration) {
	show_loading = false;
	buttons_show = true;
	global.failed_registration = false;
	menu_switch_pause(false);
}
