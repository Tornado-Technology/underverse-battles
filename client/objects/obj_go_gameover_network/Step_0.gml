/// @desc Control
if (input_check_pressed(input.right)) {
	change_button_focus(0);
	audio_play_sound(snd_click, 0, false);
}

if (input_check_pressed(input.left)) {
	change_button_focus(0);
	audio_play_sound(snd_click, 0, false);
}
