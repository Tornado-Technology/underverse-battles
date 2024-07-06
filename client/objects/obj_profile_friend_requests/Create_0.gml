sprite_index = noone;

/* GUI */
var width = display_get_gui_width();
var height = display_get_gui_height();

char_height = char_get_height("W", global._font_main_determination);

text_color_last = c_ltgrey;
text_color_standart = c_white;
text_color_selecting = c_purple;

list_size = 5;
list_middle = 3;

is_loading = true;

/* Show */
show = true;
menu_switch_pause(true);

requests = [];
request_count = array_length(requests);
request_id = 0;

request_text_x = width / 2;
request_text_y = height / 2;

for (var i = 0; i < request_count; i++) {
	requests[i].name_width = string_real_width(requests[i].username, global._font_main_determination);
}

// Strings
title_text = translate_get("Menu.Friends.RequestList");

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
	up: UIImageButton(spr_stat_arrow, function() {
		change_background_up();
	}),
	down: UIImageButton(spr_stat_arrow, function() {
		change_background_down();
	}),
}

arrow_y = height / 2 + 75;
arrow_x_left = width / 2 - 15;
arrow_x_right = width / 2 + 15;

/* Button */
button_id = 0;

button_standart = c_white;
button_selected = c_purple;

button_step_y = 20;

button_x = line_x - 20;
button_y = height / 2 - 50;

buttons = [
	UITextButton(translate_get("Menu.StandardButtons.Accept"), function() {
		send_friend_request_accept(requests[request_id].friendRequest);
		send_get_accounts_info(accountId);
		delete_from_list(request_id);
	}),
	UITextButton(translate_get("Menu.StandardButtons.Reject"), function() {
		send_friend_request_reject(requests[request_id].friendRequest);
		delete_from_list(request_id);
	}),
	UITextButton(translate_get("Menu.StandardButtons.Back"), function() {
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
	if (request_id > 0)
		request_id --;
	
	audio_play_sound_plugging(snd_click);
}

change_background_down = function() {
	if (request_id < request_count - 1)
		request_id ++;
	
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
	buttons[0].change_text(translate_get("Menu.StandardButtons.Accept"));
	buttons[1].change_text(translate_get("Menu.StandardButtons.Reject"));
	buttons[2].change_text(translate_get("Menu.StandardButtons.Back"));
})

draw_name_button = function(_x, _y, color, _id) {
	if (request_count <= _id) return;
	
	var request = requests[_id];
	color = request_id == _id ? text_color_selecting : color;
	
	draw_set_font(global._font_main_determination);
	draw_text_outlined(_x, _y, color, c_black, request.username);
	draw_reset();
	
	var hover = point_in_rectangle_gui(_x, _y, _x + request.name_width, _y + char_height);
	if (hover && input_mouse) {
		if (request_id = _id) {
			background_set(request_id);
			audio_play_sound_plugging(snd_click);
			return;
		}
		request_id = _id;
	}
}

delete_from_list = function(index) {
	array_delete(requests, index, 1);
	request_count--;
	if (request_id >= request_count) {
		request_id = request_count - 1;
	}
	
	for (var i = 0; i < request_count; i++) {
		requests[i].name_width = string_real_width(requests[i].username, global._font_main_determination);
	}
}