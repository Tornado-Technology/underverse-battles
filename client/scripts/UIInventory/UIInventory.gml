function UIInventory(character, items, max_item_count) constructor {
	self.character = character;
	self.items = items;
	self.max_item_count = max_item_count;
	
	text_color = c_white;
	text_hover_color = c_yellow;
	
	buttons = [];
	item_count = array_length(items);
	button_shift_y = 20;
	description_position_x = 118;

	on_press = function(_self) {
		var item = items[_self.index];
		switch (item.type) {
			case ITEM_TYPE.UNDEFINED:
				item.special_function();
				audio_play_sound_plugging(snd_cant_select);
				break;
			case ITEM_TYPE.HEAL:
				character.heal(item.hp);
				item.special_function();
				back();
				break;
		}
		
		if (item.can_destroy_by_use) {
			array_delete(items, buttons.current_option, 1);
			item_count--;
		}
	}
	
	back = function() {}
	
	draw_description = function(index, position_x, position_y) {
		if (buttons.current_option == index && index < item_count) {
			var sprite = spr_fight_ui_action_box;
			var text = items[index].description;
			var font = global._font_main_mini;
			var padding = 4;
			draw_sprite_ext(sprite, 0, position_x, position_y, (string_real_width(text, font) + padding * 2) / sprite_get_width(sprite), 0.5, 0, c_white, 1);
				
			draw_reset();
			draw_set_font(font);
			draw_set_color(c_white);
			draw_text(position_x + padding, position_y + padding - 3, text);
		}
	}
	
	static set_color = function(text_color, text_hover_color) {
		self.text_color = text_color;
		self.text_hover_color = text_hover_color;
	}
	
	static set_back_function = function(callback) {
		back = callback;
	}
	
	static init = function() {
		item_count = array_length(items);
		
		var i = 0;
		repeat (item_count) {
			button_names[i] = items[i].name;
			i++;
		}
		button_names[i] = translate_get("Menu.StandardButtons.Back");
		
		buttons = new UITextButtonSelector(button_names, input.up, input.down, item_count)
			.set_padding(0)
			.set_color(c_white, c_yellow)
			.set_align(fa_left)
			.set_bind_input(input.action)
		
		i = 0;
		repeat (item_count) {
			buttons.button[i].set_on_press(on_press);
			buttons.button[i].is_auto_focus = false;
			buttons.button[i].needs_hover = true;
			i++;
		}
		
		buttons.button[i].set_on_press(function() {
				back();
				audio_play_sound_plugging(snd_selection);
			})
		buttons.button[i].is_auto_focus = false;
		buttons.button[i].needs_hover = true;
	}
	
	static add_item = function(item) {
		array_push(items, item);
		item_count++;
	}
	
	static draw = function(position_x, position_y) {
		buttons.update();
		
		var i = 0;
		repeat (item_count) {
			buttons.draw(i, position_x, position_y + i * button_shift_y);
			draw_description(i, position_x + description_position_x, position_y + i * button_shift_y - 7);
			i++;
		}
		buttons.draw(i, position_x, position_y + max_item_count * button_shift_y);
	}
}