/// @description Movement

// Cutscene moving
if (is_moving) {
	x = approach(x, x_new, speed_const * dtime);
	y = approach(y, y_new, speed_const * dtime);
	
	if (x == x_new && y == y_new) {
		is_moving = false;
	}
}

// Player control
if (is_controlled) {
	var is_running = false;
	if (can_run && input_check_held(input.skip)) {
		is_running = true;
	}
	
	var sum_speed = speed_const + (speed_const * is_running);
	var movement_x = (input_check_held(input.right) - input_check_held(input.left)) * speed_const;
	var movement_y = (input_check_held(input.down) - input_check_held(input.up)) * speed_const;
	
	change_sprite_by_condition(movement_x > 0, walking_right_animation);
	change_sprite_by_condition(movement_x < 0, walking_left_animation);
	change_sprite_by_condition(movement_y > 0, walking_down_animation);
	change_sprite_by_condition(movement_y < 0, walking_up_animation);
	change_sprite_by_condition(movement_x == 0 && sprite_index == walking_right_animation, standing_right_animation);
	change_sprite_by_condition(movement_x == 0 && sprite_index == walking_left_animation, standing_left_animation);
	change_sprite_by_condition(movement_y == 0 && sprite_index == walking_down_animation, standing_down_animation);
	change_sprite_by_condition(movement_y == 0 && sprite_index == walking_up_animation, standing_up_animation);

	x += movement_x;
	y += movement_y;
}

// Following to object
if (is_following && point_distance(x, y, follow_target.x, follow_target.y) > follow_distance) {
	x = approach(x, follow_target.x, speed_const * dtime);
	y = approach(y, follow_target.y, speed_const * dtime);
	
	if (x == x_new && y == y_new) {
		is_moving = false;
	}
}