function get_joystick() {
	var controls = global.__ui_controls_instance;
	if (controls == noone) return;
	
	if (controls.controllers_index != control_input_mode.ui_joystick) return;
	
	return controls.get_controller();
}