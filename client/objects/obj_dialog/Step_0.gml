if (global.pause_game) exit;

ui.process_current_text(function() {
	event_user(5);
	event_user(6);
	event_user(7);
	ui.set_voice(voice);
});
ui.update();