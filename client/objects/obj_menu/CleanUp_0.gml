on_translate_update.disconnect(translate_update);
on_network_login.disconnect(login_callback);
on_network_connection_timeout.disconnect(disconnect_callback);

on_goto_page_event.disconnect_all();
delete on_goto_page_event;

pages_foreach(function(page) {
	for (var i = 0; i < array_length(page); i++) {
		page[i].destroy();
	}
});