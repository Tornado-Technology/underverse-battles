keyboard_clear_lastkey();

if (instance_exists(obj_menu)) {
	menu.on_goto_page_event.disconnect(connection);
}