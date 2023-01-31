if (pause) {
	input_e = 0;
	input_v = 0;
	input_h = 0;
	held_h  = 0;
	input_wheel = 0;
	exit;
}

if (!input_is_locked) {
	input_e = input_check_pressed(input.action) || (element_mouse_index != -1 ? mouse_check_button_pressed(mb_left) : false);
	input_v = input_check_pressed(input.down) - input_check_pressed(input.up);
	input_h = input_check_pressed(input.right) - input_check_pressed(input.left);
	held_h  = input_check_held(input.right) - input_check_held(input.left);
	input_wheel = mouse_wheel_up() - mouse_wheel_down();
}

if (input_v != 0) {
	on_change_element();
}

if ((keyboard_check_pressed(vk_anykey) || mouse_check_button(mb_any)) && anykey_show) {
	anykey_show = false;
	elements_show = true;
	keyboard_clear_lastkey();
}

if (input_h == -1 && page_index == menu_page.main && elements_show) {
	elements_show = false;
	anykey_show = true;
}
