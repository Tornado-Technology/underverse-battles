function SettingsMobileArrow(menu_instance, sprite_arrow) {
	var instance = new ClassSettingsMobileArrow(menu_instance, sprite_arrow);
	instance.init();
	
	return instance;
}


function ClassSettingsMobileArrow (menu_instance, sprite_arrow) :  ClassSettingsMobileElement(menu_instance, sprite_arrow) constructor  {
	self.sprite_arrow = sprite_arrow;

	scale_max = 1.8;

	key_name = "Menu.Settings.MobileControls.Elements.Arrow.Name";
	key_position = "Settings.MobileControls.Controller.Arrows.Position.";
	key_scale = "Settings.MobileControls.Controller.Scale";
	static base_draw = draw;
	static base_save_data = save_data;
	
	UI = sprite_arrow
	
	
	static init = function() {
		display_name = translate_get(key_name);
		controller_up_x = data_get(		key_position	+	"Up.X");
		controller_up_y = data_get(		key_position	+	"Up.Y");
		controller_down_x = data_get(	key_position	+	"Down.X");
		controller_down_y = data_get(	key_position	+	"Down.Y");
		controller_left_x = data_get(	key_position	+	"Left.X");
		controller_left_y = data_get(	key_position +	"Left.Y");
		controller_right_x = data_get(	key_position +	"Right.X");
		controller_right_y = data_get(	key_position +	"Right.Y");
		scale = data_get(key_scale);
	}
	
	static draw = function() { 
		
		UI.up.scale_x = scale;
		UI.up.scale_y = scale;
		
		UI.down.scale_x = scale;
		UI.down.scale_y = scale;
		
		UI.left.scale_x = scale;
		UI.left.scale_y = scale;
		
		UI.right.scale_x = scale;
		UI.right.scale_y = scale;
		
		UI.up.draw(controller_up_x, controller_up_y);
		UI.down.draw(controller_down_x, controller_down_y);
		UI.left.draw(controller_left_x, controller_left_y);
		UI.right.draw(controller_right_x, controller_right_y);
							
		if (UI.up.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controller_up_x  = mouse_gui_x;
			controller_up_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		}
		
		if (!UI.up.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		}
		
		if (UI.down.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controller_down_x  = mouse_gui_x;
			controller_down_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		}
		
		if (!UI.down.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
		
		if (UI.left.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controller_left_x  = mouse_gui_x;
			controller_left_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.left.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
		
		if (UI.right.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controller_right_x  = mouse_gui_x;
			controller_right_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.right.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};

		
	};
	
	static save_data = function () {
		var data = data_set
		var controller = global.__ui_controls_instance;
		
		data(key_position + "Up.X", controller_up_x);
		data(key_position + "Up.Y",	controller_up_y);
		data(key_position + "Down.X", controller_down_x);
		data(key_position + "Down.Y",	controller_down_y);
		data(key_position + "Left.X", controller_left_x);
		data(key_position + "Left.Y",	controller_left_y);
		data(key_position + "Right.X", controller_right_x);
		data(key_position + "Right.Y",	controller_right_y);
		data(key_scale, scale);
		
		controller.controller_up_x = data_get(		key_position	+	"Up.X");
		controller.controller_up_y = data_get(		key_position	+	"Up.Y");
		controller.controller_down_x = data_get(	key_position	+	"Down.X");
		controller.controller_down_y = data_get(	key_position	+	"Down.Y");
		controller.controller_left_x = data_get(	key_position	+	"Left.X");
		controller.controller_left_y = data_get(	key_position	+	"Left.Y");
		controller.controller_right_x = data_get(	key_position	+	"Right.X");
		controller.controller_right_y = data_get(	key_position	+	"Right.Y");
		controller.get_controller().scale_x = data_get(key_scale, scale);
		controller.get_controller().scale_y = data_get(key_scale, scale);
	};
};