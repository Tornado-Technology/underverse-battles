on_translate_update.disconnect(translate_update);

pages_foreach(function(page) {
	for (var i = 0; i < array_length(page); i++) {
		page[i].destroy();
	}
})