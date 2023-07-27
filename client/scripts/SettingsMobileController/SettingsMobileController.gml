function SettingsMobileController(menu_instance, controller, controllers) {
	var instance = new ClassSettingsMobileController(menu_instance, controller, controllers)
	instance.init();
	
	return instance;
}

function ClassSettingsMobileController(menu_instance, controller, controllers) : ClassSettingsMobileElement(menu_instance, spr_empty) constructor {
	self.instance_controller = controller;
	self.controllers = controllers;
	
	scale_max = 1.8;
	
	self.controller = controllers[instance_controller.controllers_index];
	key_name = $"Menu.Settings.MobileControls.Elements.{self.controller.name}.Name";
	key_position = "Settings.MobileControls.Controller.Position";
	key_scale = "Settings.MobileControls.Controller.Scale";
	key_index = "Settings.MobileControls.Controller.Index";
	controller_names = [];
	
	uiShift = UIShift(controller_names, instance_controller.controllers_index);
	
	is_enabled_shift = true;
	change_sprite(self.controller.sprite);
	
	static base_init = init;
	static base_draw = draw;
	static base_save_data = save_data;
	
	static init = function() {
		base_init();

		var i = 0;

		repeat(array_length(controllers)) {
			var controller = controllers[i];
			var translate = translate_get($"Menu.Settings.MobileControls.Elements.{controller.name}.Name");
			
			array_push(controller_names, translate);
			i++;
		}
		
		uiShift.update_elements(controller_names, instance_controller.controllers_index);
		
		uiShift.callback = function(_, element) {
			change_controller(element);
		}
	}
	
	static change_controller = function(index) {
		instance_controller.controllers_index = index;
		
		controller = controllers[index];
		change_sprite(controller.sprite);
		
		key_name = $"Menu.Settings.MobileControls.Elements.{controller.name}.Name";
		update_display_name();
	}
	
	static draw = function() {
		base_draw();
		
		uiShift.draw(100, 90);
		
		self.controller.draw(position_x, position_y);
	}
	
	static save_data = function() {
		base_save_data();
		data_set(key_index, instance_controller.controllers_index);
		
		instance_controller.controller_x = data_get($"{key_position}.X");
		instance_controller.controller_y = data_get($"{key_position}.Y");
		instance_controller.get_controller().scale_x = data_get(key_scale, scale);
		instance_controller.get_controller().scale_y = data_get(key_scale, scale);
	}
}