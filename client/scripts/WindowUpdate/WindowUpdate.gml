if (is_desktop) {
	time_source_start(time_source_create(time_source_game, 1, time_source_units_frames, function() {
		window_frame_update();
	}, [], -1));
}
