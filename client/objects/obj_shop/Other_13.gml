/// @description Use shop buttons
if (input_check_pressed(input.up)) {
	switch (tab) {
		case 0:
			if (current_option > 0) {
				input_on_press(buttons, current_option, -1);
				current_option--;
			}
			break;
		case 1:
			if (current_item_option > 0) {
				input_on_press(item_buttons, current_item_option, -1);
				current_item_option--;
			}
			break;
		case 3:
			if (current_talk_option > 0) {
				input_on_press(talk_buttons, current_talk_option, -1);
				current_talk_option--;
			}
			break;
	}
}
if (input_check_pressed(input.down)) {
	switch (tab) {
		case 0:
			if (current_option < array_length(buttons) - 1) {
				input_on_press(buttons, current_option, 1);
				current_option++;
			}
			break;
		case 1:
			if (current_item_option < array_length(item_buttons) - 1) {
				input_on_press(item_buttons, current_item_option, 1);
				current_item_option++;
			}
			break;
		case 3:
			if (current_talk_option < array_length(talk_buttons) - 1) {
				input_on_press(talk_buttons, current_talk_option, 1);
				current_talk_option++;
			}
			break;
	}
}
if (input_check_pressed(input.action)) {
	switch (tab) {
		case 0:
			set_tab(current_option + 1);
			audio_play_sound_plugging(snd_selection);
			break;
		case 1:
			if (current_item_option == array_length(item_buttons) - 1) {
				set_tab(0);
			}
			audio_play_sound_plugging(snd_selection);
			break;
		case 3:
			if (current_talk_option == array_length(talk_buttons) - 1) {
				set_tab(0);
			}
			audio_play_sound_plugging(snd_selection);
			break;
	}
}