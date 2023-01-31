/// @desc Start choise
if (act == 1) {
	str_num = 1;
	text[0] = dialog[0];
	answers_amount = 2;
	
	for (var i = 0; i < answers_amount; i++) {
		answer_options[i] = dialog[i + 1];
	}
	
	act = 2;
	event_user(2);
}