// Position
credirs_pos_y_start = display_get_gui_height() + 2;
credirs_pos_y = credirs_pos_y_start;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// Parameters
spd = 0.2;
width = 20;
credits = [
	"UNDERVERSE BATTLES",
	"",
	translate_get("Credits.Based"),
	"[yellow]UNDERTALE",
	$"{translate_get("Credits.By")} Toby Fox",
	"",
	$"[yellow]{translate_get("Credits.Developers")}",
	"Marsilies",
	"TornadoTech",
	"Fanaetel",
	"",
	$"[yellow]{translate_get("Credits.Artists")}",
	"Sayki",
	"FoxSus",
	"Vert",
	"GrishaBroGame",
	"PurpleNeon",
	"GAS",
	$"[yellow]{translate_get("Credits.PreviewArtist")}",
	"Sock_Police",
	"",
	$"[yellow]{translate_get("Credits.Localizers")}",
	"AzzyTheTarned",
	"AX_233",
	"Loulim",
	"",
	$"[yellow]{translate_get("Credits.Tester")}",
	"Fortherehero",
	"Genno",
	"",
	$"[yellow]{translate_get("Credits.StoryCreator")}",
	"Jael Peñaloza (Jakei)",
	"",
	$"[yellow]{translate_get("Credits.Composers")}",
	"NyxTheShield",
	"Marsilies",
	"",
	$"[yellow]{translate_get("Credits.Sponsors")}",
	"Fortherehero",
	"XAnastasia_Color",
	"timofei sandler",
	"Malvaresz",
	"Alex S",
	"Кирилл Рощин",
	"Cityman",
	"Zontik52",
	"Lepeha",
	"AltRA",
	"Studiet_hero",
	"izver",
	"killgrum755",
	"Change Frisk",
	"Илья Коломацкий",
	"",
	$"[yellow]{translate_get("Credits.YouTubers")}",
	"ReStart",
	"Underplay",
	"Твой Чай",
	"Рейдер",
	"MTT_zhaba",
	"",
	$"[yellow]{translate_get("Credits.SpecialThanks")}",
	"Tesmi",
	"Trosla", "chort",
	"XAnastasia_Color",
	"GOS",
	"ReStart",
	"Emil58",
	"Evoleo",
	"RatiXs",
	"PAYTOM_MORMIER",
	"varks",
	"NOEL",
	"JuJu Adams",
	"Nik",
	"YellowAfterlife",
	"FatalikZZB",
	"NewXEvent",
	"Goating Goat",
	"Shock", "Capitan Salat",
	"UNDEREVENT Team",
	"",
	translate_get("Credits.AndYou")
];
	
str_num = array_length(credits);
credirs_pos_y_max = str_num * width;
	
// Soundtrack
audio_stop_sound(obj_menu.menu_soundtrack_current);
audio_play_sound(snd_fragmented_truce, 2, true);

/// @param {String} str
str_change_color = function(str) {
	return str == "yellow" ? c_yellow : c_white;
}

draw_one_string = function(i) {
	var str = credits[i];
	var str_pos_y = i * width + credirs_pos_y
	if (str_pos_y > gui_height || str_pos_y < -width)
		return;
	
	var param = "";
	if (string_char_at(str, 1) == "[") {
		var j = 2;
		var simb = string_char_at(str, j);

		while (string_char_at(str, j) != "]") {
			simb = string_char_at(str, j);
			param += simb;
			j++;
		}
	
		str = string_delete(str, 1, j);
	}
		
	var color = str_change_color(param);
	draw_text_outlined(gui_width / 2, str_pos_y, color, c_black, str);
}