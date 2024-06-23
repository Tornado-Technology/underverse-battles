event_inherited();

if (!is_moving || is_punching) exit;

if (collision_rectangle(x - ball_collision_width / 2, y, x + ball_collision_width / 2, y + ball_collision_height, ball, false, false) != noone &&
	ball.height < sprite_height) {
	punch();
	exit;
}

var main_speed = speed_const * dtime;
if (point_distance(x, y, ball.x, ball.y) < trigger_distance && ball.direction > trigger_direction_left && ball.direction < trigger_direction_right) {
	var distance_x = ball.x - x;
	var distance_y = ball.y - y - (sign(ball_collision_height) * ball.speed * ball.height / -ball.current_force);
	movement_x = abs(distance_x) >= ball_collision_width ? main_speed * sign(distance_x) : 0;
	movement_y = abs(distance_y) >= abs(ball_collision_height) ? main_speed * sign(distance_y) : 0;
}
else {
	var distance_x = start_position_x - x;
	var distance_y = start_position_y - y;
	movement_x = abs(distance_x) > speed_const * 2 ? main_speed * sign(distance_x) : 0;
	movement_y = abs(distance_y) > speed_const * 2 ? main_speed * sign(distance_y) : 0;
}

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
change_sprite_by_condition(movement_x == 0 && movement_y == 0, standing_sprite);

x += movement_x;
y += movement_y;