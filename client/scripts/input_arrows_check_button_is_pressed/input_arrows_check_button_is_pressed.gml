function input_arrows_check_button_is_pressed(key){
	var controls = global.__ui_controls_instance;
	if (controls == noone) return false;
	
	if (controls.controllers_index != control_input_mode.ui_arrows) return false;
	
	return controls.get_controller().input_pressed == key;
}