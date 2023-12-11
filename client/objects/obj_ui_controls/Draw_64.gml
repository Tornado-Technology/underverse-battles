if (!enable) exit;

if (controllers_index == control_input_mode.ui_joystick)	{
	controllers[controllers_index].draw(controller_x, controller_y);
};

if (controllers_index ==  control_input_mode.ui_arrows) {
	
	var controller_arrows_x = [controls_arrow_up_x, controls_arrow_down_x, controls_arrow_left_x, controls_arrow_right_x];
	var controller_arrows_y = [controls_arrow_up_y, controls_arrow_down_y, controls_arrow_left_y, controls_arrow_right_y];
	controllers[controllers_index].draw(controller_arrows_x, controller_arrows_y);

};
