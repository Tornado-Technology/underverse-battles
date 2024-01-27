///@desc Fullscreen
if (!is_desktop) exit;

if (input_check_pressed(input.fullscreen)) {
	window_set_fullscreen(!window_get_fullscreen());
}