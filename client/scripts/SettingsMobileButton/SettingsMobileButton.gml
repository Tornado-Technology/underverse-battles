function SettingsMobileButton(menu_instance, sprite, name) {
	var instance = new ClassSettingsMobileButton(menu_instance, sprite, name);
	instance.init();
	
	return instance;
}

function ClassSettingsMobileButton(menu_instance, sprite, name) : ClassSettingsMobileElement(menu_instance, sprite) constructor {
	self.name = name;
	
	scale_max = 1.8;
	
	key_name = "Menu.Settings.MobileControls.Elements.Buttons." + name + ".Name";
	key_position = "Settings.MobileControls.Buttons." + name + ".Position";
	key_scale = "Settings.MobileControls.Buttons." + name + ".Scale";
	static base_save_data = save_data;
	
	static save_data = function() {
		base_save_data();
		
		var virtual_buttons = global.__ui_fight_virtual_buttons_instance;
		var button = virtual_buttons.get_button(name);
		
		if (button == undefined) {
			logger.warning("Error in save");
			logger.warning("Not founded button: " + name);
			return;
		}
		
		button.position_x = position_x;
		button.position_y = position_y;
		button.scale = scale;
	}
}