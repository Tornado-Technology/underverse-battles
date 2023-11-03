function input_joystick_check(_input) {
	var controls = global.__ui_controls_instance;
	if (controls == noone) return false;
	
	if (controls.controllers_index != control_input_mode.ui_joystick) return false;
	
	var controller = controls.get_controller();
	
	if (!controller.has_input(_input)) return false;
		if (_input == vk_up) {
				return controller.input[$ vk_up].hold;
		};
		if (_input == vk_down) {
		
			return controller.input[$ vk_down].hold;
		};
		if (_input == vk_left) {
		
			return controller.input[$ vk_left].hold;
		};
		if (_input == vk_right) {
		
			return controller.input[$ vk_right].hold;
		};
};