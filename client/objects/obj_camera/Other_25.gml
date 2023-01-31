///@desc Fullscreen
if (!is_desktop) exit;

if (input_check_pressed(input.fullscreen))
	window_frame_set_fullscreen(!window_frame_get_fullscreen());