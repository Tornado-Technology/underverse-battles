event_inherited();

if (!moveable)
	exit;

var main_speed = speed_const * dtime;
main_speed = (ability ? main_speed / 2 : main_speed);

/* control */
if (is_desktop && !mobile_mode) {
	if(input_check_held(input.up)) 
		movement_speed_y = -main_speed; 

	if(input_check_held(input.down)) 
		movement_speed_y = main_speed;

	if(input_check_held(input.right)) 
		movement_speed_x = main_speed;
	if(input_check_held(input.left)) 
		movement_speed_x = -main_speed;
	
	if(!input_check_held(input.up) && !input_check_held(input.down)) 
		movement_speed_y = 0;
	
	if(!input_check_held(input.right) && !input_check_held(input.left)) 
		movement_speed_x = 0;
}

if (gamepad_is_connected(0)) {
	var hrv = input_moving_joytek(input.joytek_vertical_movements) * main_speed;
	var vrv = input_moving_joytek(input.joytek_horizontal_movements) * main_speed;
	
	movement_speed_x = vrv;
	movement_speed_y = hrv;
}

if (is_mobile || mobile_mode) {
	var  controllers_index = global.__ui_controls_instance.controllers_index;
	
		if (controllers_index == control_input_mode.ui_joystick) {
		var joystick = get_joystick();
		movement_speed_x = main_speed * joystick.input_vector.x;
		movement_speed_y = main_speed * joystick.input_vector.y;
	}
	
	if (controllers_index == control_input_mode.ui_arrows) {
		
	var arrows  =  get_arrow();
	var	 hmv = (input_check_held(input.down) - input_check_held(input.up)) * main_speed;
	var	 vmv = (input_check_held(input.right) - input_check_held(input.left)) * main_speed;
		arrows.input_vector.x = vmv;
		arrows.input_vector.y = hmv;
	
		movement_speed_x = arrows.input_vector.x;
		movement_speed_y = arrows.input_vector.y;
		
		arrows.input_vector.set(0, 0);
	};
};
	

x += movement_speed_x + outside_force_x + tremble_force_x;
y += movement_speed_y + outside_force_y + tremble_force_y;