/// @description Movement

// Depth
depth = -y;

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
	image_speed =  1;
	is_running = false;
	if (can_run && input_check_held(input.skip)) {
		image_speed =  1.5;
		is_running = true;
	}
	
	var sum_speed = speed_const + (speed_const * run_coefficient * is_running) * dtime;
	movement_x = (input_check_held(input.right) - input_check_held(input.left)) * sum_speed;
	movement_y = (input_check_held(input.down) - input_check_held(input.up)) * sum_speed;
}

// Following to object
if (is_following) {
	if (point_distance(x, y, follow_target.x, follow_target.y) > follow_distance + 10) {
		following = true;
	}
	if (point_distance(x, y, follow_target.x, follow_target.y) < follow_distance) {
		following = false;
	}
	if (following) {
		image_speed =  1;
		is_running = false;
		if (follow_target.is_running) {
			image_speed =  1.5;
			is_running = true;
		}
	
		var sum_speed = speed_const + (speed_const * run_coefficient * is_running) * dtime;
		
		if (follow_x == 0) {
			movement_x = approach(x, follow_target.x, sum_speed);
			movement_x -= x;
		} else {
			movement_x = follow_x;
		}
		if (follow_y == 0) {
			movement_y = approach(y, follow_target.y, sum_speed);
			movement_y -= y;
		} else {
			movement_y = follow_y;
		}
	}
	else {
		movement_x = 0;
		movement_y = 0;
	}
}

if (!is_controlled && !is_following) exit;

change_sprite_by_condition(movement_x > 0, walking_right_animation);
change_sprite_by_condition(movement_x < 0, walking_left_animation);
change_sprite_by_condition(movement_y > 0, walking_down_animation);
change_sprite_by_condition(movement_y < 0, walking_up_animation);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && sprite_index == walking_right_animation, standing_right_animation);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && sprite_index == walking_left_animation, standing_left_animation);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && sprite_index == walking_down_animation, standing_down_animation);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && sprite_index == walking_up_animation, standing_up_animation);

x += movement_x;
y += movement_y;