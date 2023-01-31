/// @desc Control
if (input_check_pressed(input.right) || input_check_pressed(input.left)) {
	change_button_focus(!selected_button);
	audio_play_sound(snd_click, 0, false);
}
