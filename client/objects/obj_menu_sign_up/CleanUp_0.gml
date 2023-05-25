keyboard_clear_lastkey();

if (instance_exists(menu) && menu.on_goto_page_event != undefined) {
	menu.on_goto_page_event.disconnect(connection);
}