if (!variable_global_exists("__ui_controls_instance") || global.__ui_controls_instance == noone) {
	global.__ui_controls_instance = id;
} else {
	instance_destroy();
}

if (is_desktop && !mobile_mode) {
	instance_destroy();
	global.__ui_controls_instance = noone;
}

enum control_input_mode {
	ui_arrows,
	ui_joystick,
}

controllers = [];
controllers[control_input_mode.ui_arrows] = UIControllerArrows();
controllers[control_input_mode.ui_joystick] = UIControllerJoystick();

controllers_index = data_get("Settings.MobileControls.Controller.Index") || control_input_mode.ui_joystick;
enable = false;

controller_x = data_get("Settings.MobileControls.Controller.Position.X");
controller_y = data_get("Settings.MobileControls.Controller.Position.Y");

change_alpha = function(value) {
	get_controller().change_alpha(value);
}

get_controller = function() {
	return controllers[controllers_index];
}
