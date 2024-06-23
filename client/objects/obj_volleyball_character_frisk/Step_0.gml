event_inherited();

if (!is_controlled || global.pause_game) {
	exit;
}

if (is_punching && !is_punched) {
	if (collision_rectangle(x - ball_collision_width / 2, y, x + ball_collision_width / 2, y + ball_collision_height, ball, false, false) &&
	ball.height < sprite_height + 2) {
		var result_punch_direction = punch_direction + irandom_range(-punch_inaccuracy, punch_inaccuracy);
		ball.punch(result_punch_direction, punch_speed, punch_force);
		is_punched = true;
	}
	exit;
}

if (input_check_held(input.action)) {
	punch();
	exit;
}
	
var main_speed = speed_const * dtime;
movement_x = (input_check_held(input.right) - input_check_held(input.left)) * main_speed;
movement_y = (input_check_held(input.down) - input_check_held(input.up)) * main_speed;
	
// Collision
if (place_meeting(x + movement_x, y, obj_game_boundary)) movement_x = 0;
if (place_meeting(x, y + movement_y, obj_game_boundary)) movement_y = 0;
if (place_meeting(x + movement_x, y + movement_y, obj_game_boundary)) {
	movement_x = 0;
	movement_y = 0;
}
	
change_sprite_by_condition(movement_x > 0, walking_right_sprite);
change_sprite_by_condition(movement_x < 0, walking_left_sprite);
change_sprite_by_condition(movement_y > 0, walking_down_sprite);
change_sprite_by_condition(movement_y < 0, walking_up_sprite);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && direction == dir.right, standing_sprite);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && direction == dir.left, standing_sprite);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && direction == dir.down, standing_sprite);
change_sprite_by_condition(movement_x == 0 && movement_y == 0 && direction == dir.up, standing_sprite);

x += movement_x;
y += movement_y;