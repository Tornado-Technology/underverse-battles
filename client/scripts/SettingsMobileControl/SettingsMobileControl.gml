function SettingsMobileControl (menu_instance, sprite_control)  {
	var instance = new ClassSettingsMobileControl(menu_instance, sprite_control);
	instance.init();
	
	return instance;	
};


function ClassSettingsMobileControl(menu_instance, sprite_control) :  ClassSettingsMobileElement(menu_instance, sprite_control) constructor {
	
	scale_max = 1.8;
	
	controller =  0;
	
	key_scale = "Settings.MobileControls.Controller.Scale"

	
	static base_draw = draw;
	static base_save_data = save_data;
	
	right_position_x = 290;
	left_position_x =  right_position_x / 1.5;
	position_y = 100;

	UI = sprite_control
	
	static init = function() {
		display_name = translate_get(key_name);
		scale = data_get(key_scale);
	};
	
	
	static draw = function () {
	var _controller = global.__ui_controls_instance;
	UI.right.draw(right_position_x, position_y, , -87);
	UI.left.draw(left_position_x, position_y, , 87);
	if (input_switching_check_button_is_pressed (vk_right)) 
	{
		if (_controller.controllers_index == control_input_mode.ui_joystick) {
			_controller.controllers_index = !_controller.controllers_index
			menu_instance.elements_reset();
		}
		_controller.controllers_index = control_input_mode.ui_joystick	
		menu_instance.elements_reset();
	};	

	if (input_switching_check_button_is_pressed(vk_left)) 
	{
		
	if	(_controller.controllers_index ==  control_input_mode.ui_arrows) {
		_controller.controllers_index = !_controller.controllers_index
		menu_instance.elements_reset();
	}
	_controller.controllers_index = control_input_mode.ui_arrows
		menu_instance.elements_reset();
};	
	
	};

	static save_data = function () {
		
		var _controller = global.__ui_controls_instance;
		
	 data_set("Settings.MobileControls.ChosetControls.Index", _controller.controllers_index)
		_controller.controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");
	}
};