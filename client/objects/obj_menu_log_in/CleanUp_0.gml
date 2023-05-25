on_network_login.disconnect(on_login);

if (instance_exists(menu) && menu.on_goto_page_event != undefined) {
	menu.on_goto_page_event.disconnect(connection);
}

keyboard_clear_lastkey();
