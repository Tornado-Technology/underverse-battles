// Positions
gui_position = {
	left_up: new Vector2(0, 137),
	left_down: new Vector2(0, room_height),
	right_up: new Vector2(room_width, 137),
	right_down: new Vector2(room_width, room_height)
}
text_indent = 15;
padding = 20;
border_sprite = spr_bg_border;

tab = 0;
current_option = 0;
current_item_option = 0;
current_talk_option = 0;

// NPC
npc = obj_muffet_seller;

// Menu
menu_button_text = [
	"Buy",
	"Sell",
	"Talk",
	"Exit"
];
menu_button_count = array_length(menu_button_text);

// Items
items = [
	"Item 1",
	"Item 2",
	"Item 3",
	"Item 4",
	"Exit",
];
item_button_count = array_length(items);

// Talk
talks = [
	"Talk 1",
	"Talk 2",
	"Talk 3",
	"Talk 4",
	"Exit",
];
talk_button_count = array_length(talks);

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

next_dialog = function() {
	keyboard_clear(keyboard_lastkey);
	cur_num++;
	event_user(2);
}

transition = function() {
	effect_fade(transition_time, 0, transition_time, c_black, true, fight_depth.ui);
	time_source_start(time_source_transition);
}

#region Buttons

ui_shop = new UIShop(menu_button_text, items, talks, set_tab);

skip_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.skip)
	.set_on_press(function() {
		if (pos < string_length(cur_text)) {
			str = cur_text;
			pos = string_length(cur_text);
		}
	});
	
next_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.action)
	.set_on_press(function() {
		if (pos == string_length(cur_text)) {
			if (cur_num == str_num - 1) {
				switch(tab) {
					case 2:
						set_tab(0);
						break;
					case 4:
						transition();
						break;
				}
			}
			else {
				next_dialog();
			}
		}
	});

#endregion

// Time source
time_source_transition = time_source_create(time_source_game, transition_time, time_source_units_seconds, function () {
	if (previous_room != undefined) {
		room_goto(previous_room);
	}
});