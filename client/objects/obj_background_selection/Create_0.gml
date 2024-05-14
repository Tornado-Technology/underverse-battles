sprite_index = noone;

/* GUI */
var width = display_get_gui_width();
var height = display_get_gui_height();

char_height = char_get_height("W", global._font_main_determination);

/* Show */
show = true;
menu_switch_pause(true);

background_counts = background_get_count();
background_id = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.BACKGROUND_CUSTOM, 0);
backgrounds = [];

for (var i = 0; i < background_counts; i++) {
	backgrounds[i] = {
		name: background_get(background_info.name, i),
		name_width: 0,
	}
	
	backgrounds[i].name_width = string_real_width(backgrounds[i].name, global._font_main_determination);
}

play_soundtrack = false;

text_color_last = c_ltgrey;
text_color_standart = c_white;
text_color_selecting = c_purple;

soundtrack_step_y = 20;

background_x = width / 2;
background_y_ = height / 2;

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
	up: UIImageButton(spr_ui_arrow, function() {
		change_background_up();
	}),
	down: UIImageButton(spr_ui_arrow, function() {
		change_background_down();
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

button_step_y = 20;

button_x = line_x - 20;
button_y = height / 2 - 10;

buttons = [
	UITextButton(translate_get().Menu.CustomSound.Cancel, function() {
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

change_background_up = function() {
	if (background_id > 0)
		background_id --;
	
	audio_play_sound_plugging(snd_click);
}

change_background_down = function() {
	if (background_id < background_counts - 1)
		background_id ++;
	
	audio_play_sound_plugging(snd_click);
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
	buttons[0].change_text(translate_get().Menu.CustomSound.Default);
	buttons[1].change_text(translate_get().Menu.CustomSound.Cancel);
})

draw_name_button = function(_x, _y, color, _id) {
	var song = backgrounds[_id];
	color = background_id == _id ? text_color_selecting : color;
	
	draw_set_font(global._font_main_determination);
	draw_text_outlined(_x, _y, color, c_black, song.name);
	draw_reset();
	
	var hover = point_in_rectangle_gui(_x, _y, _x + song.name_width, _y + char_height);
	if (hover && input_mouse) {
		if (background_id = _id) {
			background_set(background_id);
			audio_play_sound_plugging(snd_click);
			return;
		}
		background_id = _id;
	}
}