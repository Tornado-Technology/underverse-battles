function UIShop(main_button_texts, item_button_texts, talk_button_texts, set_tab_callback) constructor {
	self.set_tab_callback = set_tab_callback;

	main_button_count = array_length(main_button_texts);
	item_button_count = array_length(item_button_texts);
	talk_button_count = array_length(talk_button_texts);
	
	main_button = new UITextButtonSelector(main_button_texts)
		.set_bind_input(input.action)
		.set_color(c_white, c_yellow)
		.set_on_press(function(self_button) {
			audio_play_sound_once(snd_selection);
			set_tab_callback(self_button.index + 1);
		});
	
	item_button = new UITextButtonSelector(item_button_texts)
		.set_bind_input(input.action)
		.set_color(c_white, c_yellow);
	item_button.button[item_button_count - 1].set_on_press(function() {
		set_tab_callback(0);
	});
	
	talk_button = new UITextButtonSelector(talk_button_texts)
		.set_bind_input(input.action)
		.set_color(c_white, c_yellow)
	talk_button.button[talk_button_count - 1].set_on_press(function() {
		set_tab_callback(0);
	});
	
	static update = function(tab) {
		switch(tab) {
			case 0:
				main_button.update();
			case 1:
				item_button.update();
			case 3:
				talk_button.update();
		}
	}
	
	static draw = function(tab, index, position_x, position_y) {
		switch(tab) {
			case 0:
				main_button.draw(index, position_x, position_y);
			case 1:
				item_button.draw(index, position_x, position_y);
			case 3:
				talk_button.draw(index, position_x, position_y);
		}
	}
}