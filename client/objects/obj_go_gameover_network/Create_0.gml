sprite_index = noone;
state = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.END_STATE, 0);

selected_button = 0;

audio_stop_all();
audio_play_sound(snd_gameover, 2, true);

text_menu = translate_get("Gameover.Menu");

buttons = {
	menu: UITextButton(text_menu, function() {
		room_goto(room_menu);
		instance_destroy(obj_statistics);
		audio_stop_sound(snd_gameover);
		audio_play_sound(snd_click, 0, false);
	}),
}

button_count = array_length(variable_struct_get_names(buttons));

if (is_mobile) {
	buttons.menu.is_auto_focus = false;
}

change_button_focus = function(index) {
	var elements = variable_struct_get_names(buttons);
	
	if (index < 0 || index >= button_count) return;
	if (selected_button == index) return;
	
	buttons[$ elements[selected_button]].unfocus();
	buttons[$ elements[index]].focus();
	selected_button = index;
}