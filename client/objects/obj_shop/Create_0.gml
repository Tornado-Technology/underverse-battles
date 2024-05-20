// Positions
gui_position = {
	left_up: new Vector2(0, 137),
	left_down: new Vector2(0, room_height),
	right_up: new Vector2(room_width, 137),
	right_down: new Vector2(room_width, room_height)
}
line_thickness = 4;
text_indent = 15;
padding = 20;
border_sprite = spr_bg_border;

tab = 0;
current_option = 0;
current_item_option = 0;
current_talk_option = 0;

// Menu
menu_button_count = 4;
menu_button_text = [
	"Buy",
	"Sell",
	"Talk",
	"Exit"
];

// Items
items = [
	{name: "Item 1", cost: 0},
	{name: "Item 2", cost: 0},
	{name: "Item 3", cost: 0},
	{name: "Item 4", cost: 0},
	{name: "Exit", cost: 0},
];

// Talk
talks = [
	{name: "Talk 1", cost: 0},
	{name: "Talk 2", cost: 0},
	{name: "Talk 3", cost: 0},
	{name: "Talk 4", cost: 0},
	{name: "Exit", cost: 0},
];

// For monolog
pos = 0;
act = 1;
cur_text = "";
str = "";
str_num = 0;
cur_num = 0;

monolog = ["Hello!"];
sell_monolog = ["No!"];
greeting_monolog = ["Hello!"];
item_monolog = ["Buy!"];
talk_monolog = ["Ask!"];
farewell_monolog = ["Bye!"];

voice = snd_voice_main;
font = global._font_main_determination;
text_color = c_white;

skip_simb = "►";

// For transition
previous_room = undefined;
transition_time = 0.4;

// Buttons
for (var i = 0; i < menu_button_count; i++) {
	index = i;
	buttons[i] = UITextButton(menu_button_text[i], function() {
		set_tab(current_option + 1);
		audio_play_sound_once(snd_selection);
	});

	buttons[i].text_hover_color = c_yellow;
	buttons[i].is_auto_focus = false;
	buttons[i].index = index;
	buttons[i].halign = fa_left;
	buttons[i].padding = -5;

	buttons[i].on_hover = function(self_button) {
		buttons[current_option].set_focus(false);
		current_option = self_button.index;
		audio_play_sound_once(snd_click);
	}
}
buttons[0].set_focus(true);

for (var i = 0; i < array_length(items); i++) {
	index = i;
	item_buttons[i] = UITextButton(items[i].name, function() {
		if (index == array_length(items) - 1) {
			set_tab(0);
		}
		audio_play_sound_once(snd_selection);
	});

	item_buttons[i].text_hover_color = c_yellow;
	item_buttons[i].is_auto_focus = false;
	item_buttons[i].index = index;
	item_buttons[i].halign = fa_left;
	item_buttons[i].padding = -5;

	item_buttons[i].on_hover = function(self_button) {
		item_buttons[current_item_option].set_focus(false);
		current_item_option = self_button.index;
		audio_play_sound_once(snd_click);
	}
}
item_buttons[0].set_focus(true);

for (var i = 0; i < array_length(talks); i++) {
	index = i;
	
	talk_buttons[i] = UITextButton(talks[i].name, function() {
		if (index == array_length(talks) - 1) {
			set_tab(0);
		}
		audio_play_sound_once(snd_selection);
	});

	talk_buttons[i].text_hover_color = c_yellow;
	talk_buttons[i].is_auto_focus = false;
	talk_buttons[i].index = index;
	talk_buttons[i].halign = fa_left;
	talk_buttons[i].padding = -5;

	talk_buttons[i].on_hover = function(self_button) {
		talk_buttons[current_talk_option].set_focus(false);
		current_talk_option = self_button.index;
		audio_play_sound_once(snd_click);
	}
}
talk_buttons[0].set_focus(true);

// Skip arrow
skip_arrow = UIImageButton(spr_ui_arrow);
skip_arrow.padding = 5;

skip_arrow.on_press = function() {
	if (pos < string_length(cur_text)) {
	    keyboard_key_press(vk_shift);
	}
	else {
		keyboard_key_press(vk_enter);
	}
}
skip_arrow.on_release = function() {
	keyboard_key_release(vk_enter);
	keyboard_key_release(vk_shift);
}

// Methods
set_tab = function(index) {
	tab = index;
	
	switch(tab) {
		case 0:
			monolog = greeting_monolog;
			break;
		case 1:
			monolog = item_monolog;
			break;
		case 2:
			monolog = sell_monolog;
			break;
		case 3:
			monolog = talk_monolog;
			break;
		case 4:
			monolog = farewell_monolog;
			break;
	}
	act = 1;
}

input_on_press = function(button_array, option, count) {
	audio_play_sound_once(snd_click);
	
	if (!button_array[option].focus) {
		button_array[option].set_focus(true);
		return;
	}

	button_array[option].set_focus(false);
	option += count;
	button_array[option].set_focus(true);
};

next_dialog = function() {
	keyboard_clear(keyboard_lastkey);
	cur_num++;
	event_user(2);
}

transition = function() {
	effect_fade(transition_time, 0, transition_time, c_black, true, fight_depth.ui);
	time_source_start(time_source_transition);
}

// Time source
time_source_transition = time_source_create(time_source_game, transition_time, time_source_units_seconds, function () {
	if (previous_room != undefined) {
		room_goto(previous_room);
	}
});