sprite_index = noone;

state = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.END_STATE, 0);

if (is_mobile && state == gameover.lose) {
	YandexMobileAds_showInterstitial();
}

selected_button = 0;

audio_stop_all();
audio_play_sound(snd_gameover, 2, true);

text_menu = translate_get("Gameover.Menu");
text_restart = translate_get("Gameover.Restart");

buttons = {
	menu: new UITextButton(0, text_menu)
		.set_padding(5)
		.set_bind_input(input.action)
		.set_needs_focus(true)
		.set_on_press(function() {
			room_goto(room_menu);
			instance_destroy(obj_statistics);
			audio_stop_sound(snd_gameover);
			audio_play_sound(snd_click, 0, false);
		}),
	restart: new UITextButton(1, text_restart)
		.set_padding(5)
		.set_bind_input(input.action)
		.set_needs_focus(true)
		.set_on_press(function() {
			room_goto(room_fight);
			instance_destroy(obj_statistics);
			audio_stop_sound(snd_gameover);
			audio_play_sound(snd_click, 0, false);
		})
}

button_count = array_length(variable_struct_get_names(buttons));

on_hover = function(self_button) {
	var elements = variable_struct_get_names(buttons);
	buttons[$ elements[selected_button]].unfocus();
	selected_button = !selected_button;
}

if (is_mobile) {
	buttons.menu.is_auto_focus = false;
	buttons.restart.is_auto_focus = false;
}

buttons.menu.on_hover = function() { on_hover(); }
buttons.restart.on_hover = function() { on_hover(); }

change_button_focus = function(index) {
	var elements = variable_struct_get_names(buttons);
	
	if (index < 0 || index >= button_count) return;
	if (selected_button == index) return;
	
	buttons[$ elements[selected_button]].unfocus();
	buttons[$ elements[index]].focus();
	selected_button = index;
}