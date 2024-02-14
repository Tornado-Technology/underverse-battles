function SettingsMobileJoystick(menu_instance, sprite_border, sprite_handler) {
	var instance = new ClassSettingsMobileJoystick(menu_instance, sprite_border, sprite_handler);
	instance.init();
	
	return instance;
}

function ClassSettingsMobileJoystick(menu_instance, sprite_border, sprite_handler) : ClassSettingsMobileElement(menu_instance, sprite_border) constructor {
	self.sprite_handler = sprite_handler;
	
	scale_max = 1.8;
	
	key_name = "Menu.Settings.MobileControls.Elements.Joystick.Name";
	key_position = "Settings.MobileControls.Controller.Position";
	key_scale = "Settings.MobileControls.Controller.Scale";
	static base_draw = draw;
	static base_save_data = save_data;
	
	static draw = function() {
		base_draw();
		
		draw_sprite(sprite_handler, 0, position_x, position_y);
	}
	
	static save_data = function() {
		base_save_data();
		
		var controller = global.__ui_controls_instance;
		
		controller.controller_x = data_get(key_position + ".X");
		controller.controller_y = data_get(key_position + ".Y");
		controller.get_controller().scale_x = data_get(key_scale, scale);
		controller.get_controller().scale_y = data_get(key_scale, scale);
	}
}