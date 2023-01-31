if (!show)
	exit;

input_mouse = mouse_check_button_pressed(mb_any);

/* Sound */
var soundtrack = soundtrack_get("id", soundtrack_id);

if (playing_sound != soundtrack) {
	play_soundtrack = true;
	previous_sound = playing_sound;
	playing_sound = soundtrack;
} else if (play_soundtrack) {
	if (previous_sound != undefined) {
		previous_sound.set_gain(0, 0);
		if (previous_sound.stream) {
			previous_sound.stop();
		}
	}
	soundtrack.stop();
	soundtrack.set_gain(0, 0);
	soundtrack.set_gain(0.5, 500);
	soundtrack.play(1, true);
	play_soundtrack = false;
}
	
/* Menu control */
if (mouse_wheel_up()) {
	change_soundtrack_up();
}

if (mouse_wheel_down()) {
	change_soundtrack_down();
}

if (input_check_pressed(input.action)) {
	switch(tab) {
		case 1:
			buttons[button_id].press();
			break;
		case 0:
			soundtrack_set(soundtrack_id);
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
		change_soundtrack_up();
	} else {
		change_button_up();
	}
}

if (input_check_pressed(input.down)) {
	if (tab == 0) {
		change_soundtrack_down();
	} else {
		change_button_down();
	}
}

if (input_check_pressed(input.back))
	instance_destroy();
