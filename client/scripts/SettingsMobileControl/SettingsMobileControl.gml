function SettingsMobileControl (menu_instance)  {
	var instance = new ClassSettingsMobileControl(menu_instance);
	instance.init();
	
	return instance;	
};


function ClassSettingsMobileControl(menu_instance)  constructor {
	self.menu_instance = menu_instance;
	
	scale_max = 1.8;
	
	key_name = "";
	key_scale = "Settings.MobileControls.Controller.Scale";

	controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");

	input_pressed = undefined
	right_position_x = 290;
	left_position_x =  right_position_x / 1.5;
	position_y = 100;

	UI = {
		right: new UIImageButton(0, spr_ui_arrow),
		left: new UIImageButton(1, spr_ui_arrow)
	}
	UI.right.padding = 5;
	UI.left.padding = 5;
	
	static init = function() {
		declare_predicate();
		display_name = translate_get(key_name);
		scale = data_get(key_scale);
		controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");
	};
		
		
	static declare_predicate = function() {
			
		UI.left.on_hover = function() { 
				input_pressed = undefined;
		};
		
		UI.right.on_hover = function () {
				input_pressed = undefined;
		}
		
		UI.left.on_press = function() {
				input_pressed = vk_left;
		};

		UI.right.on_press = function() {
				input_pressed = vk_right;		
		}	

		UI.left.on_release = function() {	
				input_pressed = undefined;
		};

		UI.right.on_release = function() {
				input_pressed = undefined;
		};	
	};	
	
	static draw = function () {
		UI.right.draw(right_position_x, position_y, , -87);
		UI.left.draw(left_position_x, position_y, , 87);
		if (input_pressed == vk_right) {	
			controllers_index =  controllers_index == control_input_mode.ui_joystick ?   control_input_mode.ui_arrows :	control_input_mode.ui_joystick;
			save_data();
			menu_instance.elements_reset();
		};	

		if (input_pressed ==  vk_left) 	{	
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