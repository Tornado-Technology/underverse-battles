function SettingsMobileControl (menu_instance, sprite_control)  {
	var instance = new ClassSettingsMobileControl(menu_instance, sprite_control);
	instance.init();
	
	return instance;	
};


function ClassSettingsMobileControl(menu_instance, sprite_control) :  ClassSettingsMobileElement(menu_instance, sprite_control) constructor {
	
	scale_max = 1.8;
	
	controller =  0;
	
	key_scale = "Settings.MobileControls.Controller.Scale";

	controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");


	static base_draw = draw;
	static base_save_data = save_data;
	
	right_position_x = 290;
	left_position_x =  right_position_x / 1.5;
	position_y = 100;

	UI = sprite_control
	
	static init = function() {
		display_name = translate_get(key_name);
		scale = data_get(key_scale);
		controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");
	};
		
	static draw = function () {
	var _controller = global.__ui_controls_instance;
	UI.controls_switching.right.draw(right_position_x, position_y, , -87);
	UI.controls_switching.left.draw(left_position_x, position_y, , 87);
	if (UI.input_pressed == vk_right) 
	{	
		controllers_index =  controllers_index == control_input_mode.ui_joystick ?   control_input_mode.ui_arrows :	control_input_mode.ui_joystick;
		save_data();
		menu_instance.elements_reset();
	};	

	if (UI.input_pressed == vk_left) 
	{	
		controllers_index = controllers_index  ==  control_input_mode.ui_arrows ? control_input_mode.ui_joystick : control_input_mode.ui_arrows;
		save_data();
		menu_instance.elements_reset();
	};	
	
	};

	static save_data = function () {	
	var _controller = global.__ui_controls_instance;
	 data_set("Settings.MobileControls.ChosetControls.Index", controllers_index);
	_controller.controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");
	};
};