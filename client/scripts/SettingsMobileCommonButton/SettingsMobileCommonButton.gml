function SettingsMobileCommonButton(menu_instance, sprite, name) {
	var instance = new ClassSettingsMobileCommonButton(menu_instance, sprite, name);
	instance.init();
	
	return instance;
}

function ClassSettingsMobileCommonButton(menu_instance, sprite, name) : ClassSettingsMobileElement(menu_instance, sprite) constructor {
	self.name = name;
	
	scale_max = 1.8;
	
	key_name = "Menu.Settings.MobileControls.Elements.Buttons." + name + ".Name";
	key_position = "Settings.MobileControls.Buttons." + name + ".Position";
	key_scale = "Settings.MobileControls.Buttons." + name + ".Scale";
}