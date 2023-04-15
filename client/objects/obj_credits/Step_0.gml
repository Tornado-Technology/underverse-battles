// Change speed
if (mouse_check_button_pressed(mb_left)) {
	spd = 0.6;
}
if (mouse_check_button_pressed(mb_right)) {
	spd = -0.6;
}
if (mouse_check_button_released(mb_left) || 
	mouse_check_button_released(mb_right)) {
	spd = 0.2;
}

// Position
credirs_pos_y -= spd * dtime;

if (credirs_pos_y <= -credirs_pos_y_max) {
	credirs_pos_y = credirs_pos_y_start;
}