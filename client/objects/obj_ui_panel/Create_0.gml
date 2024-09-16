/// @desc Base menu
sprite_index = spr_empty;

active = true;
buttons = [];
index = 0;
free_index = 0;

/// @param {String} name
/// @param {Function} callback
add_button = function(name, callback) {
	var button = new UITextButton(free_index, name)
		.set_padding(5)
		.set_can_be_on_pause(false)
		.set_on_press(callback)
		.set_on_hover(function(self_button) {
			buttons[index].set_focus(false);
			index = self_button.index;
		});
	free_index ++;
	
	array_push(buttons, button);
};

blackout_alpha = 0;
blackout_alpha_target = 0.75;
to_close = false;

close = function() {
	to_close = true;
};

input_update = function() {
	if (input_check_pressed(input.down) && index < array_length(buttons) - 1) {
		input_on_press(1);
	}
	
	if (input_check_pressed(input.up) && index > 0) {
		input_on_press(-1);
	}
};

input_on_press = function(amout) {
	if (!buttons[index].focus) {
		buttons[index].set_focus(true);
		return;
	}
	
	buttons[index].set_focus(false);
	index += amout;
	buttons[index].set_focus(true);
	audio_play_sound_once(snd_click);
};
