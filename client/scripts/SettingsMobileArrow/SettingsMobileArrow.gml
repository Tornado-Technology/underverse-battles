function SettingsMobileArrow(menu_instance, sprite_arrow, index_arrow) {
	var instance = new ClassSettingsMobileArrow(menu_instance, sprite_arrow, index_arrow);
	instance.init();
	
	return instance;
}


function ClassSettingsMobileArrow (menu_instance, sprite_arrow, index_arrow) :  ClassSettingsMobileElement(menu_instance, sprite_arrow) constructor  {
	self.sprite_arrow = sprite_arrow;

	scale_max = 1.8;

	self.index_arrow = index_arrow

	key_name = "Menu.Settings.MobileControls.Elements.Arrow.Name";
	key_position = "Settings.MobileControls.Controller.Arrows.Position.";
	key_scale =  "Settings.MobileControls.Controller.Arrows.Scale.";
	static base_draw = draw;
	static base_save_data = save_data;
	
	UI = sprite_arrow
	
	
	static init = function() {
		var _scale = ["Up", "Down","Left", "Right"];
		
		display_name = translate_get(key_name);
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

		scale = data_get(key_scale  + _scale[index_arrow]);
	}
		
	static draw = function() { 
				
			UI.scale_x = scale;
			UI.scale_y = scale;
			
			UI.draw(controls_arrow_x[index_arrow], controls_arrow_y[index_arrow]);
		
		if (UI.pressed && (current_element.value == undefined || current_element.value == self)) {
			if (menu_instance.element != self) { menu_instance.change_element(self); }
			controls_arrow_x[index_arrow]  = mouse_gui_x;
			controls_arrow_y[index_arrow]  = mouse_gui_y;
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
		var controller = global.__ui_controls_instance;
		var elements = ["Up", "Down", "Left", "Right"];

		data(key_position + elements[index_arrow] + ".X", controls_arrow_x[index_arrow]);
		data(key_position + elements[index_arrow] + ".Y", controls_arrow_y[index_arrow]);
		
		controller.controls_arrow_x[index_arrow] = controls_arrow_x[index_arrow];
		controller.controls_arrow_y[index_arrow] = controls_arrow_y[index_arrow];
		
		data(key_scale + elements[index_arrow], scale);
	
	};
};