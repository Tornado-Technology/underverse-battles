if (!instance_exists(character)) exit;

if (character.is_controlled && input_check_pressed(input.special)) {
	open();
}
else if (is_open && input_check_pressed(input.special)) {
	close();
}

if (is_open) {
	position_x = lerp(position_x, position_x_finish, 0.1);
}
else {
	position_x = lerp(position_x, position_x_start, 0.1);
}