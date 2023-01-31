/// @desc Base menu
sprite_index = spr_empty;

active = true;
buttons = [];
index = 0;
free_index = 0;

/// @param {String} name
/// @param {Function} callback
add_button = function(name, callback) {
	var button = UITextButton(name, callback);
	button.index = free_index;
	free_index ++;
	button.on_hover = function(self_button) {
		buttons[index].set_focus(false);
		index = self_button.index;
	}
	
	if (is_mobile) { button.is_auto_focus = false; }
	
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
