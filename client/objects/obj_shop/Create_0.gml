gui_position = {
	left_up: new Vector2(0, 137),
	left_down: new Vector2(0, room_height),
	right_up: new Vector2(room_width, 137),
	right_down: new Vector2(room_width, room_height)
}
line_thickness = 4;
tab = 0;

menu_button_count = 4;
menu_button_text = [
	"Купить",
	"Продать",
	"Говорить",
	"Выйти"
];

for (var i = 0; i < menu_button_count; i++) {
	index = i;
	buttons[i] = UITextButton(menu_button_text[i], function() {
		tab = index + 1;
		audio_play_sound_once(snd_selection);
	});

	buttons[i].is_auto_focus = false;
	buttons[i].index = index;

	buttons[i].on_hover = function(self_button) {
		audio_play_sound_once(snd_click);
	}
}