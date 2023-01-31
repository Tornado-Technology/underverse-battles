/// @desc Start dialog
if (act == 1) {
	str_num = array_length(dialog);
		
	for (var i = 0; i < str_num; i++) {
		text[i] = dialog[i];
	}
	
	act = 2;
	event_user(2);
}