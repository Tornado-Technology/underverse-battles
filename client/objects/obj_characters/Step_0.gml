if (input_lock) exit;

tabs[tab_id].update();

input_enter = input_check_pressed(input.action);
input_back = input_check_pressed(input.back);
input_vertical = input_check_pressed(input.down) - input_check_pressed(input.up);
input_held_vertical = input_check_held(input.down) - input_check_held(input.up);
input_horizontal = input_check_pressed(input.right) - input_check_pressed(input.left);
input_wheel = mouse_wheel_up() - mouse_wheel_down();

// Target
imange_target_time++;
if (imange_target_time >= imange_target_period) {
	imange_target_time = 0;
	imange_target_num = imange_target_num ? 0 : 1;
}