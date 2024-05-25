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

// NPC
npc = obj_muffet_seller;

// Menu
menu_button_text = [
	{name: "Buy"},
	{name: "Sell"},
	{name: "Talk"},
	{name: "Exit"}
];
menu_button_count = array_length(menu_button_text);

// Items
items = [
	new Heal("Хавчик", "Восстановит 24 ХП", 24, 12),
	new Heal("Хавчик круче", "Восстановит 30 ХП", 30, 12),
	new Heal("Хавчик хуже", "Восстановит 12 ХП", 12, 12),
	new Heal("Хавчик норм", "Восстановит 20 ХП", 20, 12)
];
item_button_count = array_length(items);

// Talk
talks = [
	{name: "Talk 1", monolog: ["I say 1"], cost: 0},
	{name: "Talk 2", monolog: ["I say 2"], cost: 0},
	{name: "Talk 3", monolog: ["I say 3"], cost: 0},
	{name: "Talk 4", monolog: ["I say 4"], cost: 0}
];
talk_button_count = array_length(talks);

// Monolog
greeting_dialog = ["Hello!"];
item_dialog = ["Buy!"];
sell_dialog = ["No!"];
talk_dialog = ["Ask!"];
farewell_dialog = ["Bye!"];

voice = snd_voice_main;
font = global._font_main_determination;
text_color = c_white;

// For transition
previous_room = undefined;
transition_time = 0.4;

ui = new UIShop(greeting_dialog, item_dialog, sell_dialog, talk_dialog, farewell_dialog, menu_button_text, items, talks);

// Methods
transition = function() {
	effect_fade(transition_time, 0, transition_time, c_black, true, fight_depth.ui);
	time_source_start(time_source_transition);
}

#region Buttons

skip_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.skip)
	.set_on_press(function() {
		ui.dialog.skip_dialog();
	});
	
next_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.action)
	.set_on_press(function() {
		if (ui.dialog.is_final_text()) {
			switch(ui.tab) {
				case 2:
					ui.set_tab(0);
					break;
				case 4:
					transition();
					break;
			}
		}
		else {
			ui.dialog.next_dialog();
		}
	});

#endregion

// Time source
time_source_transition = time_source_create(time_source_game, transition_time, time_source_units_seconds, function () {
	if (previous_room != undefined) {
		room_goto(previous_room);
	}
});