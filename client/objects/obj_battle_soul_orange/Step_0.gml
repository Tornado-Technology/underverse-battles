event_inherited();

if (!moveable)
	exit;

var main_speed = speed_const * dtime;
if (is_dashing) {
	main_speed *= 2;
}

var input_up = input_check_held(input.up);
var input_down = input_check_held(input.down);
var input_left = input_check_held(input.left);
var input_right = input_check_held(input.right);
var input_only_one = input_up xor input_down xor input_left xor input_right;

// Control
if (controlled && input_only_one) {
	set_move(input_up, 0, -main_speed);
	set_move(input_down, 0, main_speed);
	set_move(input_left, -main_speed, 0);
	set_move(input_right, main_speed, 0);
}

// Image angle
if (image_angle != new_image_angle) {
	if (image_angle + 360 - new_image_angle < image_angle - new_image_angle)
		image_angle = lerp(image_angle, new_image_angle, 0.5);
	else
		image_angle = lerp(image_angle, new_image_angle - 360, 0.5);
}

// Dash
if (ability_pressed && can_dash) {
	invulnerability = true;
	is_dashing = true;
	can_dash = false;
	time_source_start(time_source_dash);
	time_source_start(time_source_cooldown);
}

// Dash particle
if (is_dashing) {
	part_type_orientation(part_type_tail, image_angle, image_angle, 0, 0, false);
	part_particles_create(part_system, x, y, part_type_tail, 1);
}

x += movement_speed_x + outside_force_x + tremble_force_x + border_force_x;
y += movement_speed_y + outside_force_y + tremble_force_y + border_force_y;