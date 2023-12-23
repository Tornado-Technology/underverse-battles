function input_joystick_check_pressed(_input) {
	var controls = global.__ui_controls_instance;
	if (controls == noone) return false;
	
	if (controls.controllers_index != control_input_mode.ui_joystick) return false;
	
	var controller = controls.get_controller();

if (!variable_struct_exists(controller.get_input(_input), "pressed")) return false;
	return controller.get_input(_input).pressed;
}