function SettingsMobileJoystick(controller) constructor {
	self.controller = controller;
	joystick = controller.controllers[control_input_mode.ui_joystick];
	
	name = "Joystick";
	border_image = joystick.border_image;
	handle_image = joystick.handle_image;
	sprite = border_image;
	
	static draw = function(position_x, position_y) {
		draw_sprite(handle_image, 0, position_x, position_y);
	}
}