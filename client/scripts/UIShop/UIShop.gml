function UIShop(main_dialog, item_dialog, sell_dialog, talk_dialog, farewell_dialog, main_button_struct, item_button_struct, talk_button_struct) constructor {
	self.main_dialog = main_dialog;
	self.item_dialog = item_dialog;
	self.sell_dialog = sell_dialog;
	self.talk_dialog = talk_dialog;
	self.farewell_dialog = farewell_dialog;
	self.main_button_struct = main_button_struct;
	self.item_button_struct = item_button_struct;
	self.talk_button_struct = talk_button_struct;
	
	tab = 0;
	
	dialog = new UIDialog(main_dialog);
	
	main_button_count = array_length(main_button_struct);
	main_button_texts = [];
	for (var i = 0; i < main_button_count; i++) {
		array_push(main_button_texts, main_button_struct[i].name);
	}
	
	item_button_count = array_length(item_button_struct);
	item_button_texts = [];
	for (var i = 0; i < item_button_count; i++) {
		array_push(item_button_texts, item_button_struct[i].name);
	}
	
	talk_button_count = array_length(talk_button_struct);
	talk_button_texts = [];
	for (var i = 0; i < talk_button_count; i++) {
		array_push(talk_button_texts, talk_button_struct[i].name);
	}
	
	main_button = new UITextButtonSelector(main_button_texts)
		.set_bind_input(input.action)
		.set_padding(2)
		.set_color(c_white, c_yellow)
		.set_align(fa_left)
		.set_on_press(function(self_button) {
			audio_play_sound_once(snd_selection);
			set_tab(self_button.index + 1);
		});
	
	item_button = new UITextButtonSelector(item_button_texts)
		.set_bind_input(input.action)
		.set_padding(2)
		.set_color(c_white, c_yellow)
		.set_align(fa_left);
	item_button.button[item_button_count - 1].set_on_press(function() {
		set_tab(0);
	});
	
	talk_button = new UITextButtonSelector(talk_button_texts)
		.set_bind_input(input.action)
		.set_padding(2)
		.set_color(c_white, c_yellow)
		.set_align(fa_left);
	talk_button.button[talk_button_count - 1].set_on_press(function() {
		set_tab(0);
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