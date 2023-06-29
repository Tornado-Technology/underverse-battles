// Position
credirs_pos_y_start = display_get_gui_height() + 2;
credirs_pos_y = credirs_pos_y_start;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// Parameters
spd = 0.2;
width = 20;
yellow = "yellow";
str_yellow = "{" + yellow + "}";

// Strings
key = "Credits.";
credits = [
	"UNDERVERSE BATTLES",
	"",
	translate_get(key + "Based"),
	str_yellow + "UNDERTALE",
	translate_get(key + "By") + " Toby Fox",
	"",
	str_yellow + translate_get(key + "Developers"),
	"TornadoTech",
	"Marsilies",
	"Tesmi",
	"",
	str_yellow + translate_get(key + "Artists"),
	"TornadoTech",
	"GrishaBroGame",
	"Sayki",
	"Anastasia_Color",
	"Sock_Police",
	"",
	str_yellow + translate_get(key + "Localizer"),
	"AzzyTheTarned",
	"AX_233",
	"",
	str_yellow + translate_get(key + "StoryCreator"),
	"Jael Peñaloza (Jakei)",
	"",
	str_yellow + translate_get(key + "Composers"),
	"NyxTheShield",
	"Marsilies",
	"",
	str_yellow + translate_get(key + "Sponsors"),
	"Fortherehero",
	"Anastasia_Color",
	"timofei sandler",
	"Malvaresz",
	"Alex S",
	"Кирилл Рощин",
	"Cityman",
	"Zontik52",
	"Lepeha",
	"CrazyBanka",
	"AltRA",
	"",
	str_yellow + translate_get(key + "YouTubers"),
	"ReStart",
	"Underplay",
	"Твой Чай",
	"Рейдер",
	"",
	str_yellow + translate_get(key + "SpecialThanks"),
	"ReStart",
	"Emil58",
	"Evoleo",
	"GOS",
	"RatiXs",
	"PAYTOM_MORMIER",
	"varks",
	"Lepeha",
	"JuJu Adams",
	"Nik",
	"YellowAfterlife",
	"UNDEREVENT Team",
	"",
	translate_get(key + "AndYou")];
	
str_num = array_length(credits);
credirs_pos_y_max = str_num * width;
	
// Soundtrack
audio_stop_sound(obj_menu.menu_soundtrack_current);
audio_play_sound(snd_fragmented_truce, 2, true);

// Methods
str_change_color = function(str) {
	if (str == yellow)
		return c_yellow;
	return c_white;
}

draw_one_string = function(i) {
	var str = credits[i];
	var str_pos_y = i * width + credirs_pos_y
	if (str_pos_y > gui_height || str_pos_y < -width)
		return;
	
	var param = "";
	if (string_char_at(str, 1) == "{") {
		var j = 2;
		var simb = string_char_at(str, j);

		while (string_char_at(str, j) != "}") {
			simb = string_char_at(str, j);
			param += simb;
			j++;
		}
	
		str = string_delete(str, 1, j);
	}
		
	var color = str_change_color(param);
	draw_text_outlined(gui_width / 2, str_pos_y, color, c_black, str);
}