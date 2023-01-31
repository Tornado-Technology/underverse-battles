/// @desc Process dialog
if (string_char_at(text[cur_num], 1) != "{") exit;

var i = 2;
var simb = string_char_at(text[cur_num], i);

name = "";
while (string_char_at(text[cur_num], i) != ":") {
	simb = string_char_at(text[cur_num], i);
	name += simb;
	i++;
}
i++;
image_type = "";
while (string_char_at(text[cur_num], i) != "}") {
	simb = string_char_at(text[cur_num], i);
	image_type += simb;
	i++;			
}

cur_text = string_delete(text[cur_num], 1, i);

event_user(5);
event_user(6);
event_user(7);