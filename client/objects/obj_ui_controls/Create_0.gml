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

controllers = [
	UIControllerArrows(),
	UIControllerJoystick()
];

controllers_index =  data_get("Settings.MobileControls.ChosetControls.Index");

enable = false;

controller_x = data_get("Settings.MobileControls.Controller.Position.X");
controller_y = data_get("Settings.MobileControls.Controller.Position.Y");

var key = "Settings.MobileControls.Controller.Arrows.Position."

controls_arrow_x = [
	data_get (key + "Up"	+ ".X"),
	data_get (key + "Down"	+ ".X"),
	data_get (key + "Left"	+ ".X"),
	data_get (key + "Right" + ".X")
	];
	
controls_arrow_y = [
	data_get (key + "Up"	+ ".Y"),
	data_get (key + "Down"	+ ".Y"),
	data_get (key + "Left"	+ ".Y"),
	data_get (key + "Right" + ".Y")
	];
	

controls_switching = UIControlSwitching();


change_alpha = function(value) {
	get_controller().change_alpha(value);
}

get_controller = function() {
	return controllers[controllers_index];
}
