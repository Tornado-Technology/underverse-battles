event_inherited();

sprite_index = spr_empty;

answer_options = [];
current_option = 0;
answers_amount = 0;

index = undefined;

callback = undefined;

input_on_press = function(amount) {
	audio_play_sound_once(snd_click);
	
	if (!answer_options[current_option].focus) {
		answer_options[current_option].set_focus(true);
		return;
	}

	answer_options[current_option].set_focus(false);
	current_option += amount;
	answer_options[current_option].set_focus(true);
};