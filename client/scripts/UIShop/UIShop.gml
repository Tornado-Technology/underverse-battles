function UIShop(main_dialog, greeting_dialog, item_dialog, sell_dialog, talk_dialog, farewell_dialog, gratitude_dialog, main_button_struct, item_button_struct, talk_button_struct) constructor {
	self.main_dialog = main_dialog;
	self.greeting_dialog = greeting_dialog;
	self.item_dialog = item_dialog;
	self.sell_dialog = sell_dialog;
	self.talk_dialog = talk_dialog;
	self.farewell_dialog = farewell_dialog;
	self.gratitude_dialog = gratitude_dialog;
	self.main_button_struct = main_button_struct;
	self.item_button_struct = item_button_struct;
	self.talk_button_struct = talk_button_struct;
	
	tab = 0;
	
	selected_button_color = c_ltgray;
	locked_button_color = c_gray;
	exit_text = translate_get("Shop.Button.Exit");
	
	dialog = new UIDialog(greeting_dialog);
	
	main_button_count = array_length(main_button_struct);
	main_button_texts = [];
	for (var i = 0; i < main_button_count; i++) {
		array_push(main_button_texts, main_button_struct[i].name);
	}
	
	item_button_count = array_length(item_button_struct) + 1;
	item_button_texts = [];
	for (var i = 0; i < item_button_count - 1; i++) {
		array_push(item_button_texts, $"{item_button_struct[i].cost}G - {item_button_struct[i].name}");
	}
	array_push(item_button_texts, exit_text);
	
	talk_button_count = array_length(talk_button_struct) + 1;
	talk_button_texts = [];
	for (var i = 0; i < talk_button_count - 1; i++) {
		array_push(talk_button_texts, talk_button_struct[i].name);
	}
	array_push(talk_button_texts, exit_text);
	
	main_button = new UITextButtonSelector(main_button_texts)
		.set_bind_input(input.action)
		.set_padding(1)
		.set_color(c_white, c_yellow)
		.set_align(fa_left)
		.set_focus()
		.set_on_press(function(self_button) {
			set_tab(self_button.index + 1);
			audio_play_sound_plugging(snd_selection);
		});
	
	item_button = new UITextButtonSelector(item_button_texts)
		.set_bind_input(input.action)
		.set_padding(1)
		.set_color(c_white, c_yellow)
		.set_align(fa_left)
		.set_focus();
	for (var i = 0; i < item_button_count - 1; i++) {
		item_button.button[i].on_press = function(_self) {
			var cost = item_button_struct[_self.index].cost;
			
			if (cost > obj_inventory.money) {
				with (obj_shop) shift_for_money_counter = 3;
				audio_play_sound_plugging(snd_cant_select);
				return;
			}
			if (obj_inventory.ui.item_count >= obj_inventory.max_item_count) {
				with (obj_shop) shift_for_item_counter = 3;
				audio_play_sound_plugging(snd_cant_select);
				return;
			}
			
			obj_inventory.add_item(item_button_struct[_self.index]);
			obj_inventory.money -= cost;
			dialog.set_new_dialog(gratitude_dialog);
			audio_play_sound_plugging(snd_purchase);
			return;
		}
	}
	item_button.button[item_button_count - 1].set_on_press(function(_self) {
		set_tab(0);
		_self.text_color = selected_button_color;
		audio_play_sound_plugging(snd_selection);
	});
	
	talk_button = new UITextButtonSelector(talk_button_texts)
		.set_bind_input(input.action)
		.set_padding(1)
		.set_color(c_white, c_yellow)
		.set_align(fa_left)
		.set_focus();
	for (var i = 0; i < talk_button_count - 1; i++) {
		talk_button.button[i].on_press = function(_self) {
			current_talk = _self.index;
			set_tab(5);
			audio_play_sound_plugging(snd_selection);
		}
	}
	talk_button.button[talk_button_count - 1].set_on_press(function() {
		set_tab(0);
		audio_play_sound_plugging(snd_selection);
	});
	
	static set_tab = function(tab) {
		self.tab = tab;
		switch(tab) {
			case 0:
				dialog.set_new_dialog(main_dialog);
				break;
			case 1:
				dialog.set_new_dialog(item_dialog);
				break;
			case 2:
				dialog.set_new_dialog(sell_dialog);
				break;
			case 3:
				dialog.set_new_dialog(talk_dialog);
				break;
			case 4:
				dialog.set_new_dialog(farewell_dialog);
				break;
			case 5:
				dialog.set_new_dialog(talk_button_struct[current_talk].monolog);
				break;
		}
	}
	
	static update = function() {
		dialog.update();
		
		switch(tab) {
			case 0:
				main_button.update();
				break;
			case 1:
				item_button.update();
				break;
			case 3:
				talk_button.update();
				break;
		}
	}
	
	static draw_dialog = function(position_x, position_y, sep, w) {
		dialog.set_separate(sep, w);
		dialog.draw(position_x, position_y);
	}
	
	static draw_buttons = function(position_x, position_y, distance) {
		var i = 0;
		switch(tab) {
			case 0:
				repeat(main_button_count) {
					main_button.draw(i, position_x, position_y + distance * i);
					i++;
				}
				break;
			case 1:
				repeat(item_button_count) {
					item_button.draw(i, position_x, position_y + distance * i);
					i++;
				}
				break;
			case 3:
				repeat(talk_button_count) {
					talk_button.draw(i, position_x, position_y + distance * i);
					i++;
				}
				break;
		}
	}
}