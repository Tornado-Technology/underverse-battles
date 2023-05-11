if (battle_border_start_animation_end()) exit;
if (_id > -1 && _id < 4) event_user(_id);

repeat(5000) {
	show_debug_message("FPS Stress!")
}