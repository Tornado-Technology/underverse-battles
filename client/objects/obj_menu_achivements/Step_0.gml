var coefficient = 3;

if (input_check_held(input.up)) {
	scroll_up();
}

if (input_check_held(input.down)) {
	scroll_down();
}

if (mouse_wheel_up()) {
	scroll_up(coefficient);
}

if (mouse_wheel_down()) {
	scroll_down(coefficient);
}
