if (!show)
	exit;

input_mouse = mouse_check_button_pressed(mb_any);

/* Menu control */
if (mouse_wheel_up()) {
	change_friend_up();
}

if (mouse_wheel_down()) {
	change_friend_down();
}

if (input_check_pressed(input.action)) {
	switch(tab) {
		case 1:
			buttons[button_id].on_press();
			break;
		case 0:
			open_friend_profile();
			break;
	}
	
	audio_play_sound_plugging(snd_selection);
}

if (input_check_pressed(input.left)) {
	change_tab_up();
}

if (input_check_pressed(input.right)) {
	change_tab_down();
}

if (input_check_pressed(input.up)) {
	if (tab == 0) {
		change_friend_up();
	} else {
		change_button_up();
	}
}

if (input_check_pressed(input.down)) {
	if (tab == 0) {
		change_friend_down();
	} else {
		change_button_down();
	}
}

if (input_check_pressed(input.back))
	instance_destroy();
