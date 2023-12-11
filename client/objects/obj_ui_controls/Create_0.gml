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
	ui_joystick,
	ui_arrows
}

controllers = [
	UIControllerJoystick(),
	UIControllerArrows()
];

controllers_index = data_get("Settings.MobileControls.ChosetControls.Index");

enable = false;

controller_x = data_get("Settings.MobileControls.Controller.Position.X");
controller_y = data_get("Settings.MobileControls.Controller.Position.Y");

var key = "Settings.MobileControls.Controller.Arrows.Position."

controls_arrow_up_x = data_get (key + "Up" + ".X");
controls_arrow_down_x = data_get (key + "Down"	+ ".X");
controls_arrow_left_x = data_get (key + "Left" + ".X");
controls_arrow_right_x = data_get (key + "Right" + ".X");

controls_arrow_up_y = data_get (key + "Up"	+ ".Y")
controls_arrow_down_y = data_get (key + "Down"	+ ".Y");
controls_arrow_left_y = data_get (key + "Left"	+ ".Y");
controls_arrow_right_y = data_get (key + "Right" + ".Y");

change_alpha = function(value) {
	get_controller().change_alpha(value);
}

get_controller = function() {
	return controllers[controllers_index];
}
