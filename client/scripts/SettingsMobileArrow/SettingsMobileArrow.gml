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
	controls_arrow_x = [
		data_get (key_position + "Up" + ".X"),
		data_get (key_position + "Down" + ".X"),
		data_get (key_position + "Left" + ".X"),
		data_get (key_position + "Right" + ".X")
		];
	
	controls_arrow_y = [
		data_get (key_position + "Up" + ".Y"),
		data_get (key_position + "Down" + ".Y"),
		data_get (key_position + "Left" + ".Y"),
		data_get (key_position + "Right" + ".Y")
		];
		
		scale = data_get(key_scale);
	}
	
	static draw = function() { 
			
		var strunct  = ["up", "down", "left", "right"  ]
		for (var i = 0; i < array_length(strunct); i++ ) {
				
			UI[$ strunct[i]].scale_x = scale;
			UI[$ strunct[i]].scale_y = scale;
			
		}
			UI.up.draw(controls_arrow_x[0], controls_arrow_y[0]);
			UI.down.draw(controls_arrow_x[1], controls_arrow_y[1]);
			UI.left.draw(controls_arrow_x[2], controls_arrow_y[2]);
			UI.right.draw(controls_arrow_x[3], controls_arrow_y[3]);
			
				
		if (UI.up.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x[@ 0]  = mouse_gui_x;
			controls_arrow_y[@ 0]  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		}
		
		if (!UI.up.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		}
		
		if (UI.down.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x[@ 1]  = mouse_gui_x;
			controls_arrow_y[@ 1]  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		}
		
		if (!UI.down.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
		
		if (UI.left.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x[@ 2]  = mouse_gui_x;
			controls_arrow_y[@ 2]  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.left.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
		
		if (UI.right.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x[@ 3]  = mouse_gui_x;
			controls_arrow_y[@ 3]  = mouse_gui_y;
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
		var elements = ["Up", "Down", "left", "Right"]
		var i = 0;
		repeat ( array_length(controls_arrow_x) ) {
					
		data(key_position + elements[i] + ".X", controls_arrow_x[i]);
		data(key_position + elements[i] + ".Y", controls_arrow_y[i]);
	
		controller.controls_arrow_x[i] = controls_arrow_x[i];
		controller.controls_arrow_y[i] = controls_arrow_y[i];
		i++;
		}
		
		data(key_scale, scale);
		

		controller.get_controller().scale_x = data_get(key_scale, scale);
		controller.get_controller().scale_y = data_get(key_scale, scale);
	};
};