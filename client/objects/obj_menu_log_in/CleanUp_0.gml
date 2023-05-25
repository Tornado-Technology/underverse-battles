on_network_login.disconnect(on_login);

if (instance_exists(obj_menu)) {
	menu.on_goto_page_event.disconnect(connection);
}

keyboard_clear_lastkey();
