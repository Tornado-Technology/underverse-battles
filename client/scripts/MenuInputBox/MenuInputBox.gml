function MenuInputBox(key_translate, show_text = true, inputbox = undefined, defaultText = "") {
	var instance = new ClassMenuInputBox(key_translate, show_text, inputbox, defaultText);
	instance.translate_update();
	instance.init();
	return instance;
}

function ClassMenuInputBox(key_translate, show_text, inputbox, defaultText) : ClassMenuElement(key_translate) constructor {
	self.show_text = show_text;
	self.inputbox = inputbox;
	self.defaultText = defaultText;
	is_shift = false;
	is_input_waiting = false;
	menu_instance = undefined;
	static inputbox_sprite = spr_ui_inputbox;
	static inputbox_width = 200;
	static inputbox_height = 18;
	static base_draw = draw;
	static base_update = update;
	static offset_from_main_text = 64;
	static text_color_enabled = c_white;
	static text_color_disabled = c_dkgray;
	
	static init = function() {
		if (inputbox == undefined) {
			inputbox = new UIInputBox(inputbox_sprite, defaultText, inputbox_width, inputbox_height, show_text);
		}
		
		inputbox.show_text = show_text;
		
		inputbox.on_activating_mouse = function() {
			menu_instance.change_element_mouse(index);
		}
		
		inputbox.on_deactivating_mouse = function() {
			menu_instance.change_element_mouse(-1);
		}
	}
	
	static update = function(position_x, position_y, menu_instance) {
		self.menu_instance = menu_instance;
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		inputbox.update(new_position_x, position_y);
		
		on_focus = function() {
			inputbox.enable();
		}
		
		on_unfocus = function() {
			inputbox.disable();
		}
		
		base_update(position_x, position_y, menu_instance);
	}
	
	static draw = function(position_x, position_y, menu_instance) {
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		
		inputbox.draw(new_position_x, position_y);
		draw_reset();
		
		base_draw(position_x, position_y, menu_instance);
	}
	
	static destroy = function() {
		inputbox.destroy();
	}
}