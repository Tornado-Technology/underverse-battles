if (!enable) exit;

if (controllers_index == control_input_mode.ui_joystick)	{
	controllers[controllers_index].draw(controller_x, controller_y);
};

if (controllers_index ==  control_input_mode.ui_arrows) {
	
	controllers[controllers_index].draw(controls_arrow_x, controls_arrow_y);
};
