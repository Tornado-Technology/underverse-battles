/// @desc Start choise
if (act == 1) {
	str_num = 1;
	text[0] = dialog[0];
	answers_amount = 2;
	
	for (var i = 0; i < array_length(answer_options); i++) {
		delete answer_options[i];
	}
	
	for (var i = 0; i < answers_amount; i++) {
		index = i;
		answer_options[i] = UITextButton(dialog[i + 1], function() {
			callback(current_option);
			instance_destroy();
		});
		
		answer_options[i].index = index;
		answer_options[i].is_separate = true;
		answer_options[i].sep = 16;
		answer_options[i].w = 130;
		
		answer_options[i].on_hover = function(self_button) {
			answer_options[current_option].set_focus(false);
			current_option = self_button.index;
		}
	}
	
	act = 2;
	event_user(2);
}