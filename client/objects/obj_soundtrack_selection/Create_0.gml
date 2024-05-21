sprite_index = noone;
depth = -1000;

/* GUI */
var width = display_get_gui_width();
var height = display_get_gui_height();

char_height = char_get_height("W", global._font_main_determination);

/* Show */
show = true;
menu_switch_pause(true);

/* Soundtrack */
soundtrack_counts = soundtrack_get_count();

var soundtrack = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM, undefined);
soundtrack_id = soundtrack == undefined ? 0 : soundtrack.index;
soundtracks = [];

for (var i = 0; i < soundtrack_counts; i++) {
	soundtracks[i] = {
		name: soundtrack_get_value(i, "name"),
		name_width: 0,
	}
	soundtracks[i].name_width = string_real_width(soundtracks[i].name, global._font_main_determination);
}

play_soundtrack = false;

text_color_last = c_ltgrey;
text_color_standart = c_white;
text_color_selecting = c_purple;

soundtrack_step_y = 20;

soundtrack_x = width / 2;
soundtrack_y = height / 2;

list_size = 5;
list_middle = 3;

/* Line */
line_x = width / 2 - 20;
line_y = height / 2;
line_height = 100;
line_width = 1;

/* Arrows */
arrow_y_up = height / 2 - 20;
arrow_y_down = height / 2 + 30;
arrow_x = width - 20;

arrow_vertical = {
	up: new UIImageButton(0, spr_ui_arrow)
		.set_on_press(function() {
			change_soundtrack_up();
		}),
	down: new UIImageButton(1, spr_ui_arrow)
		.set_on_press(function() {
			change_soundtrack_down();
		}),
}
arrow_vertical.up.padding = 5;
arrow_vertical.down.padding = 5;

arrow_y = height / 2 + 75;
arrow_x_left = width / 2 - 15;
arrow_x_right = width / 2 + 15;


/* Button */
button_id = 0;

button_standart = c_white;
button_selected = c_purple;

button_step_y = 25;

button_x = line_x - 20;
button_y = height / 2 - 10;

buttons = [
	new UITextButton(0, translate_get().Menu.CustomSound.Default)
		.set_padding(5)
		.set_on_press(function() {
			soundtrack_set(undefined);
		}),
	new UITextButton(1, translate_get().Menu.CustomSound.Cancel)
		.set_padding(5)
		.set_on_press(function() {
			instance_destroy();
		}),
]

button_count = array_length(buttons);

init_buttons = function() {
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i]._id = i;
		buttons[i].on_hover = function() {
			buttons[button_id].unfocus();
			button_id = buttons[button_id]._id;
		}
	}
}

init_buttons();

/* Tab */
tab_count = 2;
tab = 0;

/* Devlop */
playing_sound = undefined;
previous_sound = snd_alternation;

input_mouse = 0;

focus_button = function() {
	if (tab == 1) {
		buttons[button_id].focus();
	}
	else {
		buttons[button_id].unfocus();
	}
}

change_tab_up = function() {
	if (tab < tab_count - 1)
		tab++;
	focus_button();
	audio_play_sound_plugging(snd_click);
}

change_tab_down = function() {
	if (tab > 0)
		tab--;
	focus_button();
	audio_play_sound_plugging(snd_click);
}

change_soundtrack_up = function() {
	if (soundtrack_id > 0) {
		soundtrack_get("id", soundtrack_id).set_gain(0, 500);
		soundtrack_id --;
	}
	
	audio_play_sound_plugging(snd_click);
}

change_soundtrack_down = function() {
	if (soundtrack_id < soundtrack_counts - 1) {
		soundtrack_get("id", soundtrack_id).set_gain(0, 500);
		soundtrack_id ++;
	}
	
	audio_play_sound_plugging(snd_click);
}

set_soundtrack = function(_id) {
	if (_id > 0 && _id < soundtrack_counts - 1) {
		soundtrack_id = _id;
	}
}

change_button = function(_id) {
	if (_id >= 0 && _id < button_count) {
		buttons[button_id].unfocus();
		button_id = _id;
		buttons[button_id].focus();
		audio_play_sound_plugging(snd_click);
	}
}

change_button_up = function() {
	change_button(button_id - 1);
	audio_play_sound_plugging(snd_click);
}

change_button_down = function() {
	change_button(button_id + 1);
	audio_play_sound_plugging(snd_click);
}

translate_update = on_translate_update.connect(function() {
	buttons[0].set_text(translate_get().Menu.CustomSound.Default);
	buttons[1].set_text(translate_get().Menu.CustomSound.Cancel);
})

draw_name_button = function(_x, _y, color, _id) {
	var song = soundtracks[_id];
	color = soundtrack_id == _id ? text_color_selecting : color;
	
	draw_set_font(global._font_main_determination);
	draw_text_outlined(_x, _y, color, c_black, song.name);
	draw_reset();
	
	var hover = point_in_rectangle_gui(_x, _y, _x + song.name_width, _y + char_height);
	if (hover && input_mouse) {
		if (soundtrack_id = _id) {
			soundtrack_set(soundtrack_id);
			audio_play_sound_plugging(snd_click);
			return;
		}
		soundtrack_id = _id;
	}
}

audio_stop_all();