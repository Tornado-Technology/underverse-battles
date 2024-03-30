if (act != 2) exit;

if (pos < string_length(cur_text)) {
	pos++;
	simb = string_char_at(cur_text, pos);
	str += simb;
	audio_play_sound(voice, 1, false);
	
	if (pos + 1 == string_length(cur_text) && string_char_at(cur_text, pos + 1) == skip_simb) {
		next_dialog();
		exit;
	}
	
	if (pos == string_length(cur_text))
	    alarm[0] = 2;
	else if (simb == "!" && string_char_at(cur_text, pos+1) == "?")
	    alarm[0] = 2;
	else if (simb == "." && string_char_at(cur_text, pos+1) == ".")
	    alarm[0] = 2;
	else if (simb == "." || simb == "!" || simb == "?")
	    alarm[0] = 20;
	else if (simb == ",")
	    alarm[0] = 10;
	else
	    alarm[0] = 2;
}