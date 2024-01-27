event_inherited();

if (!moveable)
	exit;

var main_speed = _speed;
if (is_dashing) {
	main_speed *= 2;
}

var input_up = input_check_held(input.up);
var input_down = input_check_held(input.down);
var input_left = input_check_held(input.left);
var input_right = input_check_held(input.right);

if(input_up) {
	side_controller = input.up;
}
if(input_down) {
	side_controller = input.down;
}
if(input_left) {
	side_controller = input.left;
}
if(input_right) {
	side_controller = input.right;
}

/* control */
if (controlled) {
	if(input_up) {
		if(!input_down && !input_left && !input_left) {
			movement_speed_y = -main_speed;
			movement_speed_x = 0;
		}
	}
	if(input_down) {
		if(!input_up && !input_left && !input_left) {
			movement_speed_y = main_speed;
			movement_speed_x = 0;
		}
	}
	if(input_left) {
		if(!input_up && !input_down && !input_right) {
			movement_speed_x = -main_speed;
			movement_speed_y = 0;
		}
	}
		if(input_right) {
		if(!input_up && !input_down && !input_left) {
			movement_speed_x = main_speed;
			movement_speed_y = 0;
		}
	}
}

// Image angle
if (image_angle != new_image_angle) {
	if (image_angle + 360 - new_image_angle < image_angle - new_image_angle)
		image_angle = lerp(image_angle, new_image_angle, 0.5);
	else
		image_angle = lerp(image_angle, new_image_angle - 360, 0.5);
}

// Dash
if (ability && can_dash) {
	invulnerability = true;
	is_dashing = true;
	time_source_start(time_source_dash);
	time_source_start(time_source_cooldown);
}

// Dash particle
if (is_dashing) {
	part_type_orientation(part_type_tail, image_angle, image_angle, 0, 0, false);
	part_particles_create(global.part_system_soul, x, y, part_type_tail, 1);
}

x += movement_speed_x + outside_force_x + tremble_force_x + border_force_x;
y += movement_speed_y + outside_force_y + tremble_force_y + border_force_y;