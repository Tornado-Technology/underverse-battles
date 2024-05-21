// Abstruct
function ClassSettingsMobileElement(menu_instance, sprite) constructor {
	static current_element = { value: undefined }
	self.menu_instance = menu_instance;
	self.sprite = sprite;
	
	position_x = 0;
	position_y = 0;
	
	scale = 1;
	scale_max = 1;
	
	display_name = "";
	is_enabled_shift = false;
	
	key_name = "";
	key_position = "";
	key_scale = "";
	
	UI = new UIImageButton(0, sprite);
	
	static change_sprite = function(sprite) {
		self.sprite = sprite;
		self.UI.set_image(sprite);
	}
	
	static init = function() {
		display_name = translate_get(key_name);
		position_x = data_get(key_position + ".X");
		position_y = data_get(key_position + ".Y");
		scale = data_get(key_scale);
	}
	
	static update_display_name = function() {
		display_name = translate_get(key_name);
	}
	
	static draw = function() {
		UI.scale_x = scale;
		UI.scale_y = scale;
		UI.draw(position_x, position_y);
		
		if (UI.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			position_x = mouse_gui_x;
			position_y = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		}
		
		if (!UI.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		}
	}
	
	static save_data = function() {
		data_set(key_position + ".X", position_x);
		data_set(key_position + ".Y", position_y);
		data_set(key_scale, scale);
	}
}