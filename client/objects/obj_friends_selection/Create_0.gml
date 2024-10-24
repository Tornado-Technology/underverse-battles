sprite_index = spr_empty;

/* GUI */
var width = display_get_gui_width();
var height = display_get_gui_height();

char_height = char_get_height("W", global._font_main_determination);

text_color_last = c_ltgrey;
text_color_standart = c_white;
text_color_selecting = c_purple;

list_size = 5;
list_middle = 3;

is_return_to_menu = true;

/* Show */
show = true;
menu_switch_pause(true);
friends = global.friend_accounts;
friend_id = 0;

friend_text_x = width / 2;
friend_text_y = height / 2;

for (var i = 0; i < array_length(friends); i++) {
	friends[i].name_width = string_real_width(friends[i].username, global._font_main_determination);
}

// Strings
title_text = array_length(friends) == 0 ? translate_get("Menu.Friends.NoFriends") : translate_get("Menu.Friends.Title");

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
			change_friend_up();
		}),
	down: new UIImageButton(1, spr_ui_arrow)
		.set_on_press(function() {
			change_friend_down();
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
	new UITextButton(0, translate_get("Menu.Friends.FindFriend")).set_on_press(function() {
		obj_menu.goto_page(menu_page.find_friend);
		instance_destroy();
	}),
	new UITextButton(1, translate_get("Menu.Friends.RequestList")).set_on_press(function() {
		instance_create(obj_profile_friend_requests);
		is_return_to_menu = false;
		instance_destroy();
	}),
	new UITextButton(2, translate_get("Menu.StandardButtons.Back")).set_on_press(function() {
		obj_menu.goto_page(menu_page.account);
		instance_destroy();
	})
];

button_count = array_length(buttons);

init_buttons = function() {
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i].index = i;
		buttons[i].on_hover = function() {
			buttons[button_id].unfocus();
			button_id = buttons[button_id].index;
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

change_friend_up = function() {
	if (friend_id > 0)
		friend_id --;
	
	audio_play_sound_plugging(snd_click);
}

change_friend_down = function() {
	if (friend_id < array_length(friends) - 1)
		friend_id ++;
	
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
	buttons[0].change_text(translate_get("Menu.Friends.FindFriend"));
	buttons[1].change_text(translate_get("Menu.StandardButtons.Back"));
});

open_friend_profile = function() {
	instance_create(obj_friend_profile, {
		friend: friends[friend_id],
		index: friend_id
	});
	obj_menu.goto_page(menu_page.friend_profile);
	instance_destroy();
}

draw_name_button = function(_x, _y, color, _id) {
	if (array_length(friends) <= _id) return;
	
	var friend = friends[_id];
	color = friend_id == _id ? text_color_selecting : color;
	
	draw_set_font(global._font_main_determination);
	draw_text_outlined(_x, _y, color, c_black, friend.username);
	draw_reset();
	
	var hover = point_in_rectangle_gui(_x, _y, _x + friend.name_width, _y + char_height);
	if (hover && input_mouse) {
		if (friend_id == _id) {
			open_friend_profile();
			audio_play_sound_plugging(snd_selection);
			return;
		}
		friend_id = _id;
	}
}
