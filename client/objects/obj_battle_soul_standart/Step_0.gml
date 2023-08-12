event_inherited();

if (!moveable)
	exit;

var main_speed = 1.8 * dtime;
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

if (is_mobile || mobile_mode) {
	if (instance_exists(obj_ui_controls)) {
		var controller = controller_get();
		movement_speed_x = main_speed * controller.input_vector.x;
		movement_speed_y = main_speed * controller.input_vector.y;
	}
}

strict_place_meeting_walls();

x += movement_speed_x + outside_force_x + tremble_force_x + border_force_x;
y += movement_speed_y + outside_force_y + tremble_force_y + border_force_y;