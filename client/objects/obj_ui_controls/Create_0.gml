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

controllers_index = 0;
enable = false;

controller_x = data_get("Settings.MobileControls.Controller.Position.X");
controller_y = data_get("Settings.MobileControls.Controller.Position.Y");

var key = "Settings.MobileControls.Controller.Arrows.Position."

controller_up_x		= data_get(	key	+	"Up.X");
controller_up_y		= data_get(	key	+	"Up.Y");
controller_down_x	= data_get(	key	+	"Down.X");
controller_down_y	= data_get(	key	+	"Down.Y");
controller_left_x	= data_get(	key	+	"Left.X");
controller_left_y	= data_get(	key +	"Left.Y");
controller_right_x	= data_get(	key +	"Right.X");
controller_right_y	= data_get(	key +	"Right.Y");


change_alpha = function(value) {
	get_controller().change_alpha(value);
}

get_controller = function() {
	return controllers[controllers_index];
}
