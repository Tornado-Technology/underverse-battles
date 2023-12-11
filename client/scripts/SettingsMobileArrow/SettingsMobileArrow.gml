function SettingsMobileArrow(menu_instance, sprite_arrow, index_arrow) {
	var instance = new ClassSettingsMobileArrow(menu_instance, sprite_arrow, index_arrow);
	instance.init();
	
	return instance;
}

function SettingsMobileArrowUp(menu_instance, sprite_arrow) {
	var instance = new ClassSettingsMobileArrowUp(menu_instance, sprite_arrow);
	instance.init();
	
	return instance;
}

function SettingsMobileArrowDown(menu_instance, sprite_arrow) {
	var instance = new ClassSettingsMobileArrowDown(menu_instance, sprite_arrow);
	instance.init();
	
	return instance;
}

function SettingsMobileArrowLeft(menu_instance, sprite_arrow) {
	var instance = new ClassSettingsMobileArrowLeft(menu_instance, sprite_arrow);
	instance.init();
	
	return instance;
}

function SettingsMobileArrowRight(menu_instance, sprite_arrow) {
	var instance = new ClassSettingsMobileArrowRight(menu_instance, sprite_arrow);
	instance.init();
	
	return instance;
}



function ClassSettingsMobileArrowUp (menu_instance, sprite_arrow) :  ClassSettingsMobileElement(menu_instance, sprite_arrow) constructor {
	self.sprite_arrow = sprite_arrow;

	scale_max = 1.8;

	key_name = "Menu.Settings.MobileControls.Elements.Arrow.Name";
	key_position = "Settings.MobileControls.Controller.Arrows.Position.Up";
	key_scale =  "Settings.MobileControls.Controller.Arrows.Scale.Up";
	static base_draw = draw;
	static base_save_data = save_data;
	static init = function() {
		
		display_name = translate_get(key_name);
		controls_arrow_x = 	data_get (key_position + ".X");
		controls_arrow_y =	data_get (key_position + ".Y");
	
		scale = data_get(key_scale);
	}
		
	static draw = function() { 
				
			UI.scale_x = scale;
			UI.scale_y = scale;
			
			UI.draw(controls_arrow_x, controls_arrow_y);
	
		if (UI.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x = mouse_gui_x;
			controls_arrow_y = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
				
	};

	static save_data = function () {
		var data = data_set
		var controller = global.__ui_controls_instance

		data(key_position  + ".X", controls_arrow_x);
		data(key_position  + ".Y", controls_arrow_y);
		
		controller.controls_arrow_up_x = controls_arrow_x;
		controller.controls_arrow_up_y = controls_arrow_y;
		
		
		data(key_scale, scale);
	
	};
};

function ClassSettingsMobileArrowDown (menu_instance, sprite_arrow) :  ClassSettingsMobileElement(menu_instance, sprite_arrow) constructor {
		self.sprite_arrow = sprite_arrow;

	scale_max = 1.8;

	

	key_name = "Menu.Settings.MobileControls.Elements.Arrow.Name";
	key_position = "Settings.MobileControls.Controller.Arrows.Position.Down";
	key_scale =  "Settings.MobileControls.Controller.Arrows.Scale.Down";
	static base_draw = draw;
	static base_save_data = save_data;
	
	static init = function() {
		
		display_name = translate_get(key_name);
		controls_arrow_x = 	data_get (key_position + ".X");
		controls_arrow_y =	data_get (key_position + ".Y");
	
		scale = data_get(key_scale);
	}
		
	static draw = function() { 
				
			UI.scale_x = scale;
			UI.scale_y = scale;
			
			UI.draw(controls_arrow_x, controls_arrow_y);
		
		if (UI.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x = mouse_gui_x;
			controls_arrow_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
				
	};

	static save_data = function () {
		var data = data_set
		var controller = global.__ui_controls_instance

		data(key_position  + ".X", controls_arrow_x);
		data(key_position  + ".Y", controls_arrow_y);
		
		controller.controls_arrow_down_x = controls_arrow_x;
		controller.controls_arrow_down_y = controls_arrow_y;
		
		
		data(key_scale, scale);
	
	};
};

function ClassSettingsMobileArrowLeft (menu_instance, sprite_arrow) :  ClassSettingsMobileElement(menu_instance, sprite_arrow) constructor {
		self.sprite_arrow = sprite_arrow;

	scale_max = 1.8;

	

	key_name = "Menu.Settings.MobileControls.Elements.Arrow.Name";
	key_position = "Settings.MobileControls.Controller.Arrows.Position.Left";
	key_scale =  "Settings.MobileControls.Controller.Arrows.Scale.Left";
	
	static base_draw = draw;
	static base_save_data = save_data;
	
	static init = function() {
		
		display_name = translate_get(key_name);
		controls_arrow_x = 	data_get (key_position + ".X");
		controls_arrow_y =	data_get (key_position + ".Y");

		scale = data_get(key_scale);
	}
		
	static draw = function() { 
				
			UI.scale_x = scale;
			UI.scale_y = scale;
			
			UI.draw(controls_arrow_x, controls_arrow_y);
		
		if (UI.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x  = mouse_gui_x;
			controls_arrow_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
				
	};

	static save_data = function () {
		var data = data_set
		var controller = global.__ui_controls_instance

		data(key_position +  ".X", controls_arrow_x);
		data(key_position +  ".Y", controls_arrow_y);
		data(key_scale, scale);
		
		controller.controls_arrow_left_x = controls_arrow_x;
		controller.controls_arrow_left_y = controls_arrow_y;
	
	};
};


function ClassSettingsMobileArrowRight (menu_instance, sprite_arrow) :  ClassSettingsMobileElement(menu_instance, sprite_arrow) constructor {
		self.sprite_arrow = sprite_arrow;

	scale_max = 1.8;

	
	key_name = "Menu.Settings.MobileControls.Elements.Arrow.Name";
	key_position = "Settings.MobileControls.Controller.Arrows.Position.Right";
	key_scale =  "Settings.MobileControls.Controller.Arrows.Scale.Right";
	static base_draw = draw;
	static base_save_data = save_data;
		
	static init = function() {
		
		display_name = translate_get(key_name);
		controls_arrow_x = 	data_get (key_position + ".X");
		controls_arrow_y =	data_get (key_position + ".Y");
	
		scale = data_get(key_scale);
	}
		
	static draw = function() { 
				
			UI.scale_x = scale;
			UI.scale_y = scale;
			
			UI.draw(controls_arrow_x, controls_arrow_y);
		
		if (UI.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x  = mouse_gui_x;
			controls_arrow_y  = mouse_gui_y;
			current_element.value = self;
			menu_instance.slider.is_enable = false;
		};
		
		if (!UI.pressed && current_element.value == self) { 
			current_element.value = undefined;
			menu_instance.slider.is_enable = true;
		};
				
	};

	static save_data = function () {
		var data = data_set
		var controller = global.__ui_controls_instance

		data(key_position + ".X", controls_arrow_x);
		data(key_position + ".Y", controls_arrow_y);
		
		controller.controls_arrow_right_x = controls_arrow_x;
		controller.controls_arrow_right_y = controls_arrow_y;
		data(key_scale, scale);
	
	};
};