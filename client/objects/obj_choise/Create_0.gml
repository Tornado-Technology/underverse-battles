event_inherited();

sprite_index = -4;

answer_options = [];
current_option = 0;
answers_amount = 0;

index = undefined;

callback = undefined;

input_on_press = function(amout) {
	if (!answer_options[current_option].focus) {
		answer_options[current_option].set_focus(true);
		return;
	}
	
	answer_options[current_option].set_focus(false);
	current_option += amout;
	answer_options[current_option].set_focus(true);
	audio_play_sound_once(snd_click);
};

