if (!enable) exit;

if (controllers_index == 1)	{
controllers[controllers_index].draw(controller_x, controller_y);
};

if (controllers_index == 0) {
	var up_x = controller_up_x;
	var up_y = controller_up_y;
	var down_x = controller_down_x;
	var down_y = controller_down_y;
	var left_x = controller_left_x;
	var left_y = controller_left_y;
	var right_x = controller_right_x;
	var right_y = controller_right_y;
	
	
	controllers[controllers_index].draw(up_x, up_y, down_x, down_y, left_x, left_y, right_x, right_y);
}